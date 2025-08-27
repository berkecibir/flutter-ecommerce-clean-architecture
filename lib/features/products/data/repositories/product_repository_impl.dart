import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_app/core/errors/failures.dart';
import 'package:flutter_e_commerce_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:flutter_e_commerce_app/features/products/domain/entities/product.dart';
import 'package:flutter_e_commerce_app/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final productModels = await remoteDataSource.getProducts();
      final products = productModels.map((model) => model.toEntity()).toList();
      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheProducts(List<Product> products) {
    // TODO: implement clearCache
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> clearCache() {
    // TODO: implement getCachedProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getCachedProducts() {
    // TODO: implement getCachedProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getDiscountedProducts() async {
    try {
      final productModels = await remoteDataSource.getDiscountedProducts();
      final products = productModels.map((model) => model.toEntity()).toList();
      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getFeaturedProducts() async {
    try {
      final prodcutsModel = await remoteDataSource.getFeaturedProducts();
      final products = prodcutsModel.map((e) => e.toEntity()).toList();
      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(int id) async {
    try {
      final productModel = await remoteDataSource.getProductById(id);
      return Right(productModel.toEntity());
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
    String category,
  ) async {
    try {
      final productModel = await remoteDataSource.getProductsByCategory(
        category,
      );
      final products = productModel.map((model) => model.toEntity()).toList();
      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsById(int id) {
    // TODO: implement getProductsById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByPriceRange(
    double min,
    double max,
  ) async {
    try {
      final productModel = await remoteDataSource.getProductsByPriceRange(
        min,
        max,
      );
      final product = productModel.map((model) => model.toEntity()).toList();
      return Right(product);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByRating(
    double minRating,
  ) async {
    try {
      final productModels = await remoteDataSource.getProductsByRating(
        minRating,
      );
      final products = productModels.map((model) => model.toEntity()).toList();
      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getTopRatedProducts() async {
    try {
      final prodcutModels = await remoteDataSource.getTopRatedProducts();
      final products = prodcutModels.map((model) => model.toEntity()).toList();
      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) async {
    try {
      final productModel = await remoteDataSource.searchProducts(query);
      final products = productModel.map((model) => model.toEntity()).toList();
      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
