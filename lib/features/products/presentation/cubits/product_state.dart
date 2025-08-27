import 'package:equatable/equatable.dart';
import 'package:flutter_e_commerce_app/features/products/domain/entities/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<Product> products;

  const ProductLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object?> get props => [message];
}

// Search ve filtering için özel states
class ProductSearchLoading extends ProductState {
  final String query;

  const ProductSearchLoading({required this.query});

  @override
  List<Object?> get props => [query];
}

class ProductSearchLoaded extends ProductState {
  final List<Product> products;
  final String query;

  const ProductSearchLoaded({required this.products, required this.query});

  @override
  List<Object?> get props => [products, query];
}

class ProductSearchError extends ProductState {
  final String message;
  final String query;

  const ProductSearchError({required this.message, required this.query});

  @override
  List<Object?> get props => [message, query];
}
