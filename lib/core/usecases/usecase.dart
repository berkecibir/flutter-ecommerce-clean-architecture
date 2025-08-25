import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_commerce_app/core/errors/failures.dart';

// 🎯 Tüm use case'lerimizin base interface'i

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// 🔧 Parametresiz use case'ler için
abstract class NoParamsUseCase<Type> {
  Future<Either<Failure, Type>> call();
}

// 📝 Use Case parametreleri için base class
abstract class Params extends Equatable {
  const Params();

  @override
  List<Object> get props => [];
}

// 🚫 Parametresiz durumlarda kullanılacak
class NoParams extends Params {
  const NoParams();
}
