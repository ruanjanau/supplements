part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _ProductsStateInitial;
  const factory ProductsState.loading() = _ProductsStateLoading;
  const factory ProductsState.data({required List<ProductsModel> products}) =
      _ProductsStateData;
  const factory ProductsState.error({required String message}) =
      _ProductsStateError;
}
