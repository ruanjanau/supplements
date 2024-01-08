class ProductsError {
  ProductsError._({this.message = ''});

  final String message;

  factory ProductsError.server({String message = ''}) =>
      ProductsError._(message: message);

  factory ProductsError.unexpected() => ProductsError._();
}
