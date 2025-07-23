import 'dart:developer';

import 'package:basic_restaurant/core/errors/errors/failure.dart';
import 'package:basic_restaurant/core/services/cloud_firestore_service.dart';
import 'package:basic_restaurant/features/home/data/models/product_model.dart';
import 'package:basic_restaurant/features/home/data/repositories/home_repo.dart';
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
      log(products[0].name.toString());
      return Right(products);
    } catch (e) {
      return Left(FirebaseFirestoreFailure(errMessage: e.toString()));
    }
  }
}
