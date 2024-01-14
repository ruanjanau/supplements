import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supplements/src/app/products/data/datasources/datasource.dart';
import 'package:supplements/src/app/products/data/models/model.dart';
import 'package:supplements/src/app/products/domain/errors/error.dart';

class IProductsDataSourceMock extends Mock implements IProductsDataSource {}

class DioMock extends Mock implements Dio {}

void main() {
  late IProductsDataSourceMock dataSourceMock;
  late DioMock dioMock;

  setUp(() {
    dataSourceMock = IProductsDataSourceMock();
    dioMock = DioMock();
  });

  group('IProductsDataSource /', () {
    test('Deve retornar uma lista de ProductsModel', () async {
      final responseData = [
        {
          'id': 1,
          'product': 'Whey',
          'price': 'R\$144,00',
          'brand': 'max',
          'image': 'https://example.com/marcadeteste/icon.png',
          'details': 'Whey é bom pra saúde',
          'stock': false,
        },
        {
          'id': 1,
          'product': 'Creatina',
          'price': 'R\$99,00',
          'brand': 'Max Titanium',
          'image': 'https://example.com/marcadeteste/icon.png',
          'details': 'Creatina ajuda a melhorar o teu desempenho',
          'stock': true,
        },
      ];

      when(() => dioMock.get(any())).thenAnswer((_) async => Response(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: '')));

      // Usar o DioMock no ProductsDataSource
      final productsDataSource = ProductsDataSource(dioMock);

      // Executar o método que você está testando
      final result = await productsDataSource.getProducts();

      // Verificar se o resultado é uma lista de ProductsModel
      expect(result, isA<List<ProductsModel>>());
    });
    test('Deve retornar um erro', () {
      when(() => dataSourceMock.getProducts())
          .thenThrow(ProductsError.unexpected());

      expect(
        () async => await dataSourceMock.getProducts(),
        throwsA(isA<ProductsError>()),
      );
    });
  });
}
