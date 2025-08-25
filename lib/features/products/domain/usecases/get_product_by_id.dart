import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_app/core/errors/failures.dart';
import 'package:flutter_e_commerce_app/core/usecases/usecase.dart';
import 'package:flutter_e_commerce_app/features/products/domain/entities/product.dart';
import 'package:flutter_e_commerce_app/features/products/domain/repositories/product_repository.dart';

class GetProductById implements Usecase<Product, GetProductByIdParams> {
  final ProductRepository repository;

  GetProductById(this.repository);

  @override
  Future<Either<Failure, Product>> call(GetProductByIdParams params) async {
    return await repository.getProductById(params.id);
  }
}

class GetProductByIdParams extends Params {
  final int id;

  const GetProductByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}
