import '../../domain/entities/entity.dart';

class ProductsModel {
  final int? id;
  final String? product;
  final String? price;
  final String? image;
  final String? details;

  ProductsModel({
    this.id,
    this.product,
    this.price,
    this.image,
    this.details,
  });

  factory ProductsModel.fromJson(dynamic map) {
    return ProductsModel(
      id: map['id']?.toInt(),
      product: map['product'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
      details: map['details'] ?? '',
    );
  }

  ProductsEntity toEntity() {
    return ProductsEntity(
      id: id ?? 0,
      product: product ?? '',
      price: price ?? '',
      image: image ?? '',
      details: details ?? '',
    );
  }
}
