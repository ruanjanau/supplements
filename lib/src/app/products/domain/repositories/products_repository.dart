import 'package:dartz/dartz.dart';
import '../entities/entity.dart';
import '../errors/error.dart';

abstract class IProductsRepository {
  Future<Either<ProductsError, List<ProductsEntity>>> getAll();
}
