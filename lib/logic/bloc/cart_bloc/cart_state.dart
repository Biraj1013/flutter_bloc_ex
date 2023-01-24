import '../../../data/model/product_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class IsIncrementState extends CartState {
  final int quantity;

  IsIncrementState(
    this.quantity,
  );
}

class ItemAddedToCartState extends CartState {
  final List<ProductModel> products;
  final int quantity;
  final int totalItem;
  final double totalAmount;

  ItemAddedToCartState(
    this.products,
    this.quantity,
    this.totalItem,
    this.totalAmount,
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
