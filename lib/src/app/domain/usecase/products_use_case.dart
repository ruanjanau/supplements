import 'package:dartz/dartz.dart';
import 'package:supplements/src/app/domain/repository/products_repository.dart';
import '../entities/entity.dart';
import '../error/error.dart';

abstract class IProductsUseCase {
  Future<Either<ProductsError, List<ProductsEntity>>> getProducts();
}

class ProductsUseCase implements IProductsUseCase {
  final IProductsRepository repository;

  ProductsUseCase(this.repository);
  @override
  Future<Either<ProductsError, List<ProductsEntity>>> getProducts() {
    return repository.getAll();
  }
}
