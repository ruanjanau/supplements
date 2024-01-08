import 'package:dartz/dartz.dart';
import '../repositories/repository.dart';
import '../entities/entity.dart';
import '../errors/error.dart';

abstract class IProductsUseCase {
  Future<Either<ProductsError, List<ProductsEntity>>> call();
}

class ProductsUseCase implements IProductsUseCase {
  final IProductsRepository repository;

  ProductsUseCase(this.repository);
  @override
  Future<Either<ProductsError, List<ProductsEntity>>> call() {
    return repository.getAll();
  }
}
