import 'package:dartz/dartz.dart';

import '../../domain/entities/entity.dart';
import '../../domain/errors/error.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/products_datasource.dart';

class ProductsRepository implements IProductsRepository {
  final IProductsDataSource dataSource;

  ProductsRepository(this.dataSource);
  @override
  Future<Either<ProductsError, List<ProductsEntity>>> getAll() async {
    try {
      var result = await dataSource.getProducts();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ProductsError.unexpected());
    }
  }
}
