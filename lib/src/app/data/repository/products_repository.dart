import 'package:dartz/dartz.dart';

import '../../domain/entities/entity.dart';
import '../../domain/error/error.dart';
import '../../domain/repository/repository.dart';
import '../datasource/products_data_source.dart';

class ProductsRepository implements IProductsRepository {
  final ProductsDataSource dataSource;

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
