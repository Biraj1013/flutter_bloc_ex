import 'package:bloctest/logic/bloc/product_bloc/product_event.dart';
import 'package:bloctest/logic/bloc/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/product_model.dart';
import '../../../../data/repositories/products_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // int _quantity = 0;
  // int get quantity => _quantity;
  // final int _inCartItems = 0;
  // int get inCartItems => _inCartItems + _quantity;
  // final Map<int, ProductModel> _items = {};
  // Map<int, ProductModel> get items => _items;

  ProductBloc() : super(ProductLoadingState()) {
    on<ProductFetchEvent>((ProductFetchEvent event, Emitter emit) async {
      ProductsRepository productsRepository = ProductsRepository();
      try {
        List<ProductModel> products = await productsRepository.fetchData();
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
    // on<IsIncrementEvent>((event, emit) {
    //   setQuantity(event.increment);
    //   emit(IsIncrementState(inCartItems));
    // });
    // on<ItemAddToCartEvent>((event, emit) {
    //   addItem(event.product, quantity);
    //   emit(ItemAddToCartState(
    //       getItems, getQuantity(event.product), totalItems, totalAmount));
    // });
  }

  // void setQuantity(bool isIncrement) {
  //   if (isIncrement) {
  //     _quantity = checkQuantity(_quantity + 1);
  //   } else {
  //     _quantity = checkQuantity(_quantity - 1);
  //   }
  // }

  // int checkQuantity(int quantity) {
  //   if ((_inCartItems + quantity) < 0) {
  //     if (_inCartItems > 0) {
  //       _quantity = _inCartItems;
  //       log('quantity : $_inCartItems');
  //       return _quantity;
  //     }
  //     return 0;
  //   } else if ((_inCartItems + quantity) > 20) {
  //     log('quantity : $_inCartItems');
  //     return 20;
  //   } else {
  //     return quantity;
  //   }
  // }

  // void addItem(ProductModel product, int quantity) {
  //   log("add items call");
  //   log("id :${product.id}");
  //   log("quntity:$quantity");
  //   var totalQuantity = 0;
  //   if (_items.containsKey(product.id!)) {
  //     _items.update(product.id!, (value) {
  //       totalQuantity = quantity;
  //       log("items updated");
  //       return ProductModel(
  //         id: value.id,
  //         name: value.name,
  //         price: value.price,
  //         imageLink: value.imageLink,
  //         quantity: totalQuantity,
  //       );
  //     });
  //     if (totalQuantity <= 0) {
  //       _items.remove(product.id);
  //     }
  //   } else {
  //     if (quantity > 0) {
  //       _items.putIfAbsent(product.id!, () {
  //         return ProductModel(
  //           id: product.id,
  //           name: product.name,
  //           price: product.price,
  //           imageLink: product.imageLink,
  //           quantity: quantity,
  //         );
  //       });
  //     } else {}
  //   }
  // }

  // int getQuantity(ProductModel product) {
  //   var quantity = 0;
  //   if (_items.containsKey(product.id)) {
  //     _items.forEach((key, value) {
  //       if (key == product.id) {
  //         quantity = value.quantity!;
  //       }
  //     });
  //   }
  //   log("taotal quntity:$quantity");
  //   return quantity;
  // }

  // int get totalItems {
  //   var totalQuantity = 0;
  //   _items.forEach((key, value) {
  //     totalQuantity += value.quantity!;
  //   });
  //   return totalQuantity;
  // }

  // List<ProductModel> get getItems {
  //   return _items.entries.map((e) {
  //     return e.value;
  //   }).toList();
  // }

  // double get totalAmount {
  //   double total = 0.0;
  //   _items.forEach((key, value) {
  //     total += (value.quantity! * double.parse(value.price!));
  //   });
  //   return total;
  // }

  // void _addToCart(AddToCartEvent event, Emitter<AllProductsState> emit) {
  //   final state = this.state;
  //   if (state is AllProductsLoadedState) {
  //     int index = state.productList!.indexOf(event.product);
  //     final List<Product> cartProducts = state.productList!.map((element) {
  //       if (element.id == event.product.id) {
  //         return state.productList![index].copyWith(addedToCart: true);
  //       }
  //       return element;
  //     }).toList();
  //     emit(AllProductsLoadedState(productList: cartProducts));
  //   }
  // }

}
