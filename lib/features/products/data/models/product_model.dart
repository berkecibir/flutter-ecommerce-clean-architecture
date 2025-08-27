import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class ProductModel extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final double price;

  @HiveField(5)
  @JsonKey(name: 'discountPercentage')
  final double discountPercentage;

  @HiveField(6)
  final double rating;

  @HiveField(7)
  final int stock;

  @HiveField(8)
  final List<String> tags;

  @HiveField(9)
  final String? brand;

  @HiveField(10)
  final String sku;

  @HiveField(11)
  final int weight;

  @HiveField(12)
  final ProductDimensionsModel dimensions;

  @HiveField(13)
  final String warrantyInformation;

  @HiveField(14)
  final String shippingInformation;

  @HiveField(15)
  final String availabilityStatus;

  @HiveField(16)
  final List<ProductReviewModel> reviews;

  @HiveField(17)
  final String returnPolicy;

  @HiveField(18)
  final int minimumOrderQuantity;

  @HiveField(19)
  final ProductMetaModel meta;

  @HiveField(20)
  final List<String> images;

  @HiveField(21)
  final String thumbnail;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      tags: tags,
      brand: brand,
      sku: sku,
      weight: weight,
      dimensions: dimensions.toEntity(),
      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      availabilityStatus: availabilityStatus,
      reviews: reviews.map((review) => review.toEntity()).toList(),
      returnPolicy: returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity,
      meta: meta.toEntity(),
      images: images,
      thumbnail: thumbnail,
    );
  }

  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      price: entity.price,
      discountPercentage: entity.discountPercentage,
      rating: entity.rating,
      stock: entity.stock,
      tags: entity.tags,
      brand: entity.brand,
      sku: entity.sku,
      weight: entity.weight,
      dimensions: ProductDimensionsModel.fromEntity(entity.dimensions),
      warrantyInformation: entity.warrantyInformation,
      shippingInformation: entity.shippingInformation,
      availabilityStatus: entity.availabilityStatus,
      reviews: entity.reviews
          .map((review) => ProductReviewModel.fromEntity(review))
          .toList(),
      returnPolicy: entity.returnPolicy,
      minimumOrderQuantity: entity.minimumOrderQuantity,
      meta: ProductMetaModel.fromEntity(entity.meta),
      images: entity.images,
      thumbnail: entity.thumbnail,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    tags,
    brand,
    sku,
    weight,
    dimensions,
    warrantyInformation,
    shippingInformation,
    availabilityStatus,
    reviews,
    returnPolicy,
    minimumOrderQuantity,
    meta,
    images,
    thumbnail,
  ];
}

@JsonSerializable()
@HiveType(typeId: 1)
class ProductDimensionsModel extends Equatable {
  @HiveField(0)
  final double width;

  @HiveField(1)
  final double height;

  @HiveField(2)
  final double depth;

  const ProductDimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory ProductDimensionsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDimensionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDimensionsModelToJson(this);

  ProductDimensions toEntity() {
    return ProductDimensions(width: width, height: height, depth: depth);
  }

  factory ProductDimensionsModel.fromEntity(ProductDimensions entity) {
    return ProductDimensionsModel(
      width: entity.width,
      height: entity.height,
      depth: entity.depth,
    );
  }

  @override
  List<Object> get props => [width, height, depth];
}

@JsonSerializable()
@HiveType(typeId: 2)
class ProductReviewModel extends Equatable {
  @HiveField(0)
  final int rating;

  @HiveField(1)
  final String comment;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String reviewerName;

  @HiveField(4)
  final String reviewerEmail;

  const ProductReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReviewModelToJson(this);

  ProductReview toEntity() {
    return ProductReview(
      rating: rating,
      comment: comment,
      date: date,
      reviewerName: reviewerName,
      reviewerEmail: reviewerEmail,
    );
  }

  factory ProductReviewModel.fromEntity(ProductReview entity) {
    return ProductReviewModel(
      rating: entity.rating,
      comment: entity.comment,
      date: entity.date,
      reviewerName: entity.reviewerName,
      reviewerEmail: entity.reviewerEmail,
    );
  }

  @override
  List<Object> get props => [
    rating,
    comment,
    date,
    reviewerName,
    reviewerEmail,
  ];
}

@JsonSerializable()
@HiveType(typeId: 3)
class ProductMetaModel extends Equatable {
  @HiveField(0)
  final DateTime createdAt;

  @HiveField(1)
  final DateTime updatedAt;

  @HiveField(2)
  final String barcode;

  @HiveField(3)
  final String qrCode;

  const ProductMetaModel({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory ProductMetaModel.fromJson(Map<String, dynamic> json) =>
      _$ProductMetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMetaModelToJson(this);

  ProductMeta toEntity() {
    return ProductMeta(
      createdAt: createdAt,
      updatedAt: updatedAt,
      barcode: barcode,
      qrCode: qrCode,
    );
  }

  factory ProductMetaModel.fromEntity(ProductMeta entity) {
    return ProductMetaModel(
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      barcode: entity.barcode,
      qrCode: entity.qrCode,
    );
  }

  @override
  List<Object> get props => [createdAt, updatedAt, barcode, qrCode];
}

extension ProductModelList on List<ProductModel> {
  List<Product> toEntityList() {
    return map((model) => model.toEntity()).toList();
  }
}

extension ProductEntityList on List<Product> {
  List<ProductModel> toModelList() {
    return map((entity) => ProductModel.fromEntity(entity)).toList();
  }
}
