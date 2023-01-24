import '../../../data/model/product_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

// class ItemDecrementState extends CartState {
//   final int quantity;
//   ItemDecrementState(this.quantity);

//   @override
//   List<Object> get props => [quantity];
// }

class IsIncrementState extends CartState {
  final int quantity;

  IsIncrementState(
    this.quantity,
  );
}

class ItemAddToCartState extends CartState {
  final List<ProductModel> products;
  final int quantity;
  final int totalItem;
  final double totalAmount;

  ItemAddToCartState(
      this.products, this.quantity, this.totalItem, this.totalAmount);
}

// class ItemAddedToCartState extends CartState {
//   final List<ProductModel> products;
//   final double totalAmount;

//   ItemAddedToCartState(this.products, this.totalAmount);
// }

// class ItemAddedToCartState extends CartState {
//   final int totalItem;

//   ItemAddedToCartState(this.totalItem);

//   @override
//   List<Object> get props => [];
// }
