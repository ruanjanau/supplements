import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:supplements/src/app/products/domain/entities/entity.dart';
import 'package:supplements/src/app/products/domain/errors/error.dart';
import 'package:supplements/src/app/products/domain/repositories/repository.dart';
import 'package:supplements/src/app/products/domain/usecases/usecase.dart';

class MockProductsRepository extends Mock implements IProductsRepository {}

class ProductsEntityMock extends Mock implements ProductsEntity {}

void main() {
  late MockProductsRepository repository;
  late ProductsUseCase useCase;

  setUp(() {
    repository = MockProductsRepository();
    useCase = ProductsUseCase(repository);
  });
  group('ProductsUseCase', () {
    test('Deve retornar um ProductsEntity', () async {
      when(() => repository.getAll())
          .thenAnswer((_) async => Right([ProductsEntityMock()]));

      var resultado = await useCase();

      expect(resultado.isRight(), true);
      expect(resultado.fold((id), (listaProdutos) => listaProdutos.first),
          isA<ProductsEntityMock>());
    });

    test('Deve retornar um erro', () async {
      when(() => repository.getAll())
          .thenAnswer((_) async => Left(ProductsError.unexpected()));

      var result = await useCase();

      expect(result.isLeft(), true);
      expect(result.fold((id), (id)), isA<ProductsError>());
    });
  });
}
