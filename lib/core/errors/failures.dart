import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
  @override
  List<Object> get props => [];
}

// 🌐 Network Failures
class ServerFailure extends Failure {
  final String message;

  const ServerFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

class ConnectionFailure extends Failure {
  const ConnectionFailure();
}

// 💾 Cache Failures
class CacheFailure extends Failure {
  final String message;
  const CacheFailure(this.message);

  @override
  List<Object> get props => [message];
}

// 📝 Validation Failures
class ValidationFailure extends Failure {
  final String message;
  const ValidationFailure(this.message);

  @override
  List<Object> get props => [message];
}
