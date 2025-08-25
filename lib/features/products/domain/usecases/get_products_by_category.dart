import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_app/core/errors/failures.dart';
import 'package:flutter_e_commerce_app/core/usecases/usecase.dart';
import 'package:flutter_e_commerce_app/features/products/domain/entities/product.dart';
import 'package:flutter_e_commerce_app/features/products/domain/repositories/product_repository.dart';

class GetProductsByCategory
    implements Usecase<List<Product>, GetProductsByCategoryParams> {
  final ProductRepository repository;
  GetProductsByCategory(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(
    GetProductsByCategoryParams params,
  ) async {
    return await repository.getProductsByCategory(params.category);
  }
}

class GetProductsByCategoryParams extends Params {
  final String category;

  const GetProductsByCategoryParams({required this.category});

  @override
  List<Object> get props => [category];
}
