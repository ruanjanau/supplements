import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supplements/src/app/products/data/datasources/datasource.dart';
import 'package:supplements/src/app/products/data/models/model.dart';
import 'package:supplements/src/app/products/data/repositories/repostitory.dart';
import 'package:supplements/src/app/products/domain/errors/error.dart';

class IProductsDataSourceMock extends Mock implements IProductsDataSource {}

void main() {
  late IProductsDataSourceMock dataSource;
  late ProductsRepository repository;

  setUp(() {
    dataSource = IProductsDataSourceMock();
    repository = ProductsRepository(dataSource);
  });

  group('ProductsRepository / ', () {
    test('Deve retornar uma lista de ProductsEntity', () async {
      when(() => dataSource.getProducts()).thenAnswer((_) async => [
            ProductsModel.fromJson({
              'id': 1,
              'product': 'Whey',
              'price': 'R\$144,00',
              'brand': 'max',
              'image': 'https://example.com/marcadeteste/icon.png',
              'details': 'Whey é bom pra saúde',
              'stock': false,
            })
          ]);
      final result = await repository.getAll();
      expect(result.fold(id, id), isNotEmpty);
    });

    test('Deve retornar um Products error', () async {
      when(() => dataSource.getProducts()).thenThrow(ProductsError.server());

      final result = await repository.getAll();

      expect(result.isLeft(), true,
          reason: 'Deveria ser um Left, indicando erro');
      expect(result.fold((l) => l, (r) => null), isA<ProductsError>());
    });
  });
}
