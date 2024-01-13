import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:supplements/src/app/products/domain/entities/entity.dart';
import 'package:supplements/src/app/products/domain/errors/error.dart';
import 'package:supplements/src/app/products/domain/repositories/repository.dart';
import 'package:supplements/src/app/products/domain/usecases/usecase.dart';

// Crie uma classe de mock para o seu repositório
class MockProductsRepository extends Mock implements IProductsRepository {}

void main() {
  group('ProductsUseCase', () {
    test('should return a list of products on success', () async {
      // Arrange
      final mockRepository = MockProductsRepository();
      final useCase = ProductsUseCase(mockRepository);

      // Crie uma lista de produtos fictícios para simular o retorno do repositório

      final List<ProductsEntity> mockProducts = [
        ProductsEntity(
          id: 1,
          product: 'Creatina',
          price: '100,00',
          brand: 'Max Titanium',
          image: '',
          details: 'Creatina excelente...',
          stock: false,
        ),
        ProductsEntity(
          id: 2,
          product: 'Whey',
          price: '140,00',
          brand: 'Max Titanium',
          image: '',
          details: 'Suplemtento excelente...',
          stock: true,
        ),
      ];

      // Simule o retorno do repositório usando Mockito
      when(mockRepository.getAll())
          .thenAnswer((_) async => Right(mockProducts));

      // Act
      final result = await useCase();

      // Assert
      // Verifique se o resultado é uma instância de Right e contém a lista de produtos esperada
      expect(result,
          equals(Right<ProductsError, List<ProductsEntity>>(mockProducts)));
    });

    test('should return an error on failure', () async {
      // Arrange
      final mockRepository = MockProductsRepository();
      final useCase = ProductsUseCase(mockRepository);

      // Simule o retorno de erro do repositório usando Mockito
      final ProductsError mockError = ProductsError.unexpected();
      when(mockRepository.getAll()).thenAnswer((_) async => Left(mockError));

      // Act
      final result = await useCase();

      // Assert
      // Verifique se o resultado é uma instância de Left e contém o erro esperado
      expect(
          result, equals(Left<ProductsError, List<ProductsEntity>>(mockError)));
    });
  });
}
