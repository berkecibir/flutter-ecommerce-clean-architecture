import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String? brand;
  final String sku;
  final int weight;
  final ProductDimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ProductReview> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final ProductMeta meta;
  final List<String> images;
  final String thumbnail;

  const Product({
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

  // 🎯 Business Logic Methods (Senin seviyene uygun)
  bool get isInStock => availabilityStatus == 'In Stock';
  bool get isLowStock => availabilityStatus == 'Low Stock';
  bool get isOutOfStock => availabilityStatus == 'Out of Stock';
  bool get hasDiscount => discountPercentage > 0;
  bool get isHighRated => rating >= 4.0;
  bool get isExpensive => price > 100;
  bool get hasReviews => reviews.isNotEmpty;
  bool get hasWarranty => warrantyInformation != 'No warranty';

  double get discountedPrice => price * (1 - discountPercentage / 100);
  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  String get formattedDiscountedPrice =>
      '\$${discountedPrice.toStringAsFixed(2)}';
  String get savingsAmount =>
      '\$${(price - discountedPrice).toStringAsFixed(2)}';

  double get averageReviewRating => reviews.isEmpty
      ? 0.0
      : reviews.map((r) => r.rating).reduce((a, b) => a + b) / reviews.length;

  int get totalReviews => reviews.length;
  List<ProductReview> get positiveReviews =>
      reviews.where((r) => r.isPositive).toList();
  List<ProductReview> get negativeReviews =>
      reviews.where((r) => r.isNegative).toList();

  // Stock durumu için color indicator
  String get stockStatusColor {
    if (isInStock) return 'green';
    if (isLowStock) return 'orange';
    return 'red';
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

class ProductDimensions extends Equatable {
  final double width;
  final double height;
  final double depth;

  const ProductDimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  double get volume => width * height * depth;
  String get formattedDimensions => '${width}cm x ${height}cm x ${depth}cm';

  @override
  List<Object> get props => [width, height, depth];
}

class ProductReview extends Equatable {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  const ProductReview({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  bool get isPositive => rating >= 4;
  bool get isNegative => rating <= 2;
  bool get isNeutral => rating == 3;

  String get formattedDate => '${date.day}/${date.month}/${date.year}';

  @override
  List<Object> get props => [
    rating,
    comment,
    date,
    reviewerName,
    reviewerEmail,
  ];
}

class ProductMeta extends Equatable {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  const ProductMeta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  @override
  List<Object> get props => [createdAt, updatedAt, barcode, qrCode];
}
