import '../../../data/model/product_model.dart';

abstract class ProductState {}

class ProductLoadingState extends ProductState {
  // @override
  // List<Object> get props => [];
}

class ProductLoadedState extends ProductState {
  final List<ProductModel> data;

  ProductLoadedState(this.data);
  // @override
  // List<Object> get props => [data];
}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState(this.error);
  // @override
  // List<Object> get props => [error];
}

// class IsIncrementState extends ProductState {
//   final int tQuantity;

//   IsIncrementState(
//     this.tQuantity,
//   );

//   // @override
//   // List<Object> get props => [];
// }

// class ItemAddToCartState extends ProductState {
//   final List<ProductModel> products;
//   final int quantity;
//   final int totalItem;
//   final double totalAmount;

//   ItemAddToCartState(
//       this.products, this.quantity, this.totalItem, this.totalAmount);
//   // @override
//   // List<Object> get props => [products];
// }
