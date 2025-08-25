// GetProductsByRating use case
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductsByRating
    implements Usecase<List<Product>, GetProductsByRatingParams> {
  final ProductRepository repository;

  GetProductsByRating(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(
    GetProductsByRatingParams params,
  ) async {
    return await repository.getProductsByRating(params.minRating);
  }
}

class GetProductsByRatingParams extends Params {
  final double minRating;

  const GetProductsByRatingParams({required this.minRating});

  @override
  List<Object> get props => [minRating];
}
