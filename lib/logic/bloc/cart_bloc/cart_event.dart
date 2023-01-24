import '../../../data/model/product_model.dart';

abstract class CartEvent {}

// class ItemIncrementEvent extends CartEvent {
//   @override
//   List<Object> get props => [];
// }

// class ItemDecrementEvent extends CartEvent {
//   @override
//   List<Object> get props => [];
// }

class IsIncrementEvent extends CartEvent {
  final bool increment;
  IsIncrementEvent(this.increment);
  // @override
  // List<Object> get props => [];
}

class ItemAddToCartEvent extends CartEvent {
  final ProductModel product;

  ItemAddToCartEvent(this.product);
  // @override
  // List<Object> get props => [product];
}

// class ItemAddedtoCartEvent extends CartEvent {
//   // @override
//   // List<Object> get props => [product];
// }

// class ItemAddedToCartEvent extends CartEvent {
//   @override
//   List<Object> get props => [];
// }
