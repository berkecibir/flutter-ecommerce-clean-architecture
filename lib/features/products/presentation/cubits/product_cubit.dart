import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_app/features/products/domain/usecases/get_categories.dart';
import 'package:flutter_e_commerce_app/features/products/domain/usecases/get_discounted_products.dart';
import 'package:flutter_e_commerce_app/features/products/domain/usecases/get_featured_products.dart';
import 'package:flutter_e_commerce_app/features/products/domain/usecases/get_products.dart';
import 'package:flutter_e_commerce_app/features/products/domain/usecases/get_products_by_category.dart';
import 'package:flutter_e_commerce_app/features/products/domain/usecases/search_products.dart';
import 'package:flutter_e_commerce_app/features/products/presentation/cubits/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;
  final SearchProducts searchProducts;
  final GetProductsByCategory getProductsByCategory;
  final GetCategories getCategories;
  final GetFeaturedProducts getFeaturedProducts;
  final GetDiscountedProducts getDiscountedProducts;

  ProductCubit({
    required this.getProducts,
    required this.searchProducts,
    required this.getProductsByCategory,
    required this.getCategories,
    required this.getFeaturedProducts,
    required this.getDiscountedProducts,
  }) : super(ProductInitial());

  // Ana ürün listesi

  Future<void> loadProducts() async {
    emit(const ProductLoading());

    final result = await getProducts();

    result.fold(
      (failure) => emit(ProductError(message: failure.toString())),
      (products) => emit(ProductLoaded(products: products)),
    );
  }

  // Ürün arama
  Future<void> searchForProducts(String query) async {
    if (query.isEmpty) {
      await loadProducts();
      return;
    }
    emit(ProductSearchLoading(query: query));
    final result = await searchProducts(SearchProductsParams(query: query));

    result.fold(
      (failure) =>
          emit(ProductSearchError(message: failure.toString(), query: query)),
      (products) => emit(ProductSearchLoaded(products: products, query: query)),
    );
  }

  // Kategoriye göre ürün yükle
  Future<void> loadProductsByCategory(String category) async {
    emit(const ProductLoading());

    final result = await getProductsByCategory(
      GetProductsByCategoryParams(category: category),
    );

    result.fold(
      (failure) => emit(ProductError(message: failure.toString())),
      (products) => emit(ProductLoaded(products: products)),
    );
  }

  // Öne çıkan ürünleri yükle
  Future<void> loadFeaturedProdcts() async {
    emit(const ProductLoading());

    final result = await getFeaturedProducts();
    result.fold(
      (failure) => emit(ProductError(message: failure.toString())),
      (products) => emit(ProductLoaded(products: products)),
    );
  }

  // İndirimli ürünleri yükle
  Future<void> loadDiscountedProducts() async {
    emit(const ProductLoading());

    final result = await getDiscountedProducts();

    result.fold(
      (failure) => emit(ProductError(message: failure.toString())),
      (products) => emit(ProductLoaded(products: products)),
    );
  }

  // Kategorileri getir (UI için)
  Future<List<String>> loadCategories() async {
    final result = await getCategories();
    return result.fold((failure) => [], (categories) => categories);
  }

  // Yenile
  Future<void> refresh() async {
    await loadProducts();
  }
}
