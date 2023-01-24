import '../../../data/model/product_model.dart';

abstract class CartEvent {}

class IsIncrementEvent extends CartEvent {
  final bool increment;
  final ProductModel products;
  IsIncrementEvent(this.increment, this.products);
  // @override
  // List<Object> get props => [];
}

class ItemAddedToCartEvent extends CartEvent {
  final int quantity;
  final ProductModel product;
  ItemAddedToCartEvent(this.quantity, this.product);
  // @override
  // List<Object> get props => [];
}

class ItemAddToCartEvent extends CartEvent {
  final ProductModel product;

  ItemAddToCartEvent(this.product);
  // @override
  // List<Object> get props => [product];
}
