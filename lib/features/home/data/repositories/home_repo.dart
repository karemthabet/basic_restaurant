import 'package:basic_restaurant/core/errors/errors/failure.dart';
import 'package:basic_restaurant/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getHomeData();


}