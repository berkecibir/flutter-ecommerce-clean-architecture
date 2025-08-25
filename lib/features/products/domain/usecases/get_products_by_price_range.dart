import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_app/core/errors/failures.dart';
import 'package:flutter_e_commerce_app/core/usecases/usecase.dart';
import 'package:flutter_e_commerce_app/features/products/domain/entities/product.dart';
import 'package:flutter_e_commerce_app/features/products/domain/repositories/product_repository.dart';

class GetProductsByPriceRange
    implements Usecase<List<Product>, GetProductsByPriceRangeParams> {
  final ProductRepository repository;
  const GetProductsByPriceRange(this.repository);
  @override
  Future<Either<Failure, List<Product>>> call(
    GetProductsByPriceRangeParams params,
  ) async {
    return await repository.getProductsByPriceRange(
      params.minPrice,
      params.maxPrice,
    );
  }
}

class GetProductsByPriceRangeParams extends Params {
  final double minPrice;
  final double maxPrice;

  const GetProductsByPriceRangeParams({
    required this.minPrice,
    required this.maxPrice,
  });

  @override
  List<Object> get props => [minPrice, maxPrice];
}
