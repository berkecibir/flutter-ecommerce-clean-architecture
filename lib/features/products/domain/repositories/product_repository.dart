import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_app/core/errors/failures.dart';
import 'package:flutter_e_commerce_app/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  // 🎯 Ana CRUD işlemleri
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProductById(int id);
  Future<Either<Failure, List<Product>>> getProductsById(int id);
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category);

  // 🔍 Arama ve filtreleme
  Future<Either<Failure, List<Product>>> searchProducts(String query);
  Future<Either<Failure, List<Product>>> getProductsByPriceRange(
    double min,
    double max,
  );
  Future<Either<Failure, List<Product>>> getProductsByRating(double minRating);

  // 💾 Cache management
  Future<Either<Failure, List<Product>>> getCachedProducts();
  Future<Either<Failure, void>> cacheProducts(List<Product> products);
  Future<Either<Failure, void>> clearCache();

  // 📊 Business operations
  Future<Either<Failure, List<Product>>> getFeaturedProducts();
  Future<Either<Failure, List<Product>>> getDiscountedProducts();
  Future<Either<Failure, List<Product>>> getTopRatedProducts();
}
