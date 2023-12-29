import 'dart:async';

import 'package:dio/dio.dart';

import '../model/model.dart';

abstract class IProductsDataSource {
  FutureOr<List<ProductsModel>> getProducts();
}

class ProductsDataSource implements IProductsDataSource {
  final Dio dio;

  ProductsDataSource(this.dio);
  @override
  FutureOr<List<ProductsModel>> getProducts() async {
    final response = await dio
        .get('https://6573803a063f876cec9cf9f6.mockapi.io/suplementos');

    return (response.data as List).map(ProductsModel.fromJson).toList();
  }
}
