class ProductsEntity {
  final int id;
  final String product;
  final String price;
  final String brand;
  final String image;
  final String details;
  final bool stock;

  ProductsEntity({
    required this.id,
    required this.product,
    required this.price,
    required this.brand,
    required this.image,
    required this.details,
    required this.stock,
  });
}
