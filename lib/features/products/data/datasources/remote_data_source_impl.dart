import 'package:dio/dio.dart';
import 'package:flutter_e_commerce_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:flutter_e_commerce_app/features/products/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';
part 'remote_data_source_impl.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/products')
abstract class ProductApiService {
  factory ProductApiService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ProductApiService;

  @GET('/')
  Future<HttpResponse<Map<String, dynamic>>> getProducts();

  @GET('/{id}')
  Future<ProductModel> getProductById(@Path('id') int id);

  @GET('/search')
  Future<HttpResponse<Map<String, dynamic>>> searchProducts(
    @Query('q') String query,
  );

  @GET('/category/{category}')
  Future<HttpResponse<Map<String, dynamic>>> getProductsByCategory(
    @Path('category') String category,
  );

  @GET('/categories')
  Future<List<String>> getCategories();
}

abstract class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ProductApiService apiService;
  ProductRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await apiService.getProducts();
      final List<dynamic> productsJson = response.data['products'] ?? [];
      return productsJson
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Exception _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout');
      case DioExceptionType.badResponse:
        return Exception('Server error: ${e.response?.statusCode}');
      case DioExceptionType.connectionError:
        return Exception('Network connection error');
      default:
        return Exception('Unknown network error');
    }
  }
}
