import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_app/core/errors/failures.dart';
import 'package:flutter_e_commerce_app/core/usecases/usecase.dart';
import 'package:flutter_e_commerce_app/features/products/domain/entities/product.dart';
import 'package:flutter_e_commerce_app/features/products/domain/repositories/product_repository.dart';

class GetDiscountedProducts implements NoParamsUseCase<List<Product>> {
  final ProductRepository repository;

  const GetDiscountedProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    return repository.getDiscountedProducts();
  }
}
