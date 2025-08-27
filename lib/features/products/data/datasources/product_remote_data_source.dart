import 'package:flutter_e_commerce_app/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductById(int id);
  Future<List<ProductModel>> searchProducts(String query);
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<List<ProductModel>> getProductsByPriceRange(double min, double max);
  Future<List<ProductModel>> getProductsByRating(double minRating);
  Future<List<String>> getCategories();
  Future<List<ProductModel>> getFeaturedProducts();
  Future<List<ProductModel>> getDiscountedProducts();
  Future<List<ProductModel>> getTopRatedProducts();
}
