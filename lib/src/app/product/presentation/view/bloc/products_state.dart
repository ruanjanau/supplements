part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  factory ProductsState.initial() = _ProductsStateInitial;

  factory ProductsState.loading() = _ProductsStateLoading;

  factory ProductsState.data({required List<ProductsModel> products}) =
      _ProductsStateData;

  factory ProductsState.error({required String error}) = _ProductsStateError;
}
