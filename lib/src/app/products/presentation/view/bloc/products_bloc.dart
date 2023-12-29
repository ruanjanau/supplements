import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasource/datasource.dart';
import '../../../data/model/model.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsDataSource _dataSource;
  ProductsBloc({required ProductsDataSource dataSource})
      : _dataSource = dataSource,
        super(const _ProductsStateInitial()) {
    on<_ProductsEventFindAll>(_findAll);
  }

  FutureOr<void> _findAll(
      _ProductsEventFindAll event, Emitter<ProductsState> emit) async {
    try {
      emit(const ProductsState.loading());
      final products = await _dataSource.getProducts();
      await Future.delayed(const Duration(seconds: 2));
      emit(ProductsState.data(products: products));
    } catch (e) {
      emit(const ProductsState.error(message: 'Error loading products'));
    }
  }
}
