import '../../domain/entities/entity.dart';

class ProductsModel {
  final int? id;
  final String? product;
  final String? price;
  final String? brand;
  final String? image;
  final String? details;
  final bool? stock;

  ProductsModel({
    this.id,
    this.product,
    this.price,
    this.brand,
    this.image,
    this.details,
    this.stock,
  });

  factory ProductsModel.fromJson(dynamic map) {
    return ProductsModel(
      id: map['id']?.toInt(),
      product: map['product'] ?? '',
      price: map['price'] ?? '',
      brand: map['brand'] ?? '',
      image: map['image'] ?? '',
      details: map['details'] ?? '',
      stock: map['stock'] ?? false,
    );
  }

  ProductsEntity toEntity() {
    return ProductsEntity(
      id: id ?? 0,
      product: product ?? '',
      price: price ?? '',
      brand: brand ?? '',
      image: image ?? '',
      details: details ?? '',
      stock: stock ?? false,
    );
  }
}
