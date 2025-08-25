import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_app/core/errors/failures.dart';
import 'package:flutter_e_commerce_app/core/usecases/usecase.dart';
import 'package:flutter_e_commerce_app/features/products/domain/repositories/product_repository.dart';

class GetCategories implements NoParamsUseCase<List<String>> {
  final ProductRepository repository;
  const GetCategories(this.repository);
  @override
  Future<Either<Failure, List<String>>> call() async {
    return await repository.getCategories();
  }
}
