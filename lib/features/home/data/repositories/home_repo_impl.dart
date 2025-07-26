import 'package:basic_restaurant/core/errors/errors/failure.dart';
import 'package:basic_restaurant/core/errors/errors/handle_firestore_error.dart';
import 'package:basic_restaurant/core/services/cloud_firestore_service.dart';
import 'package:basic_restaurant/features/home/data/models/product_model.dart';
import 'package:basic_restaurant/features/home/data/repositories/home_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final CloudFirestoreService cloudFirestoreService;

  HomeRepoImpl({required this.cloudFirestoreService});
  @override
  Future<Either<Failure, List<ProductModel>>> getHomeData() async {
    try {
      List<ProductModel> products = [];
      final docs = await cloudFirestoreService.getData(path: "product");

      for (var doc in docs) {
        final json = doc.data() as Map<String, dynamic>;
        final product = ProductModel.fromJson(json);
        products.add(product);
      }
      return Right(products);
    } on FirebaseException catch (e) {
      return Left(handleFirestoreError(e)); // Use the handler here
    } catch (e) {
      return Left(
        FirebaseFirestoreFailure(errMessage: 'Unknown error occurred: $e'),
      );
    }
  }

  @override
 Future<Either<Failure, void>> addToCart({
  required ProductModel product,
}) async {
  try {
    await cloudFirestoreService.setData(
      path: "cart/${product.id}", // ✅ Full document path
      data: product.toJson(),
    );
    return const Right(null);
  } on FirebaseException catch (e) {
    return Left(handleFirestoreError(e));
  } catch (e) {
    return Left(
      FirebaseFirestoreFailure(errMessage: 'Unknown error occurred: $e'),
    );
  }
}
  @override
  Stream<List<ProductModel>> getCartDataStream() {
    return cloudFirestoreService.streamData(path: "cart").map((snapshot) {
      List<ProductModel> products = [];
      for (var doc in snapshot) {
        final json = doc.data() as Map<String, dynamic>;
        final product = ProductModel.fromJson(json);
        products.add(product);
      }
      return products;
    });
  }
@override
Future<Either<Failure, void>> removeFromCart(String productId) async {
  try {
    await cloudFirestoreService.deleteData(path: "cart/$productId");
    return const Right(null);
  } on FirebaseException catch (e) {
    return Left(handleFirestoreError(e));
  } catch (e) {
    return Left(
      FirebaseFirestoreFailure(errMessage: 'Unknown error occurred: $e'),
    );
  }
}

}

