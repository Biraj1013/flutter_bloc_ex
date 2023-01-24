import 'dart:developer';

import 'package:bloctest/logic/bloc/cart_bloc/cart_event.dart';
import 'package:bloctest/logic/bloc/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/product_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int _quantity = 0;
  int get quantity => _quantity;
  final int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  final Map<int, ProductModel> _items = {};
  Map<int, ProductModel> get items => _items;

  CartBloc() : super(CartInitialState()) {
    // on<ItemIncrementEvent>((event, emit) {
    //   int quntity = 0;
    //   emit(ItemIncrementState(quntity + 1));
    // });
    // on<ItemDecrementEvent>((event, emit) {
    //   int quntity = 0;
    //   emit(ItemDecrementState(quntity - 1));
    // });
    on<IsIncrementEvent>((event, emit) {
      setQuantity(event.increment);
      emit(IsIncrementState(inCartItems));
    });
    on<ItemAddToCartEvent>((event, emit) {
      addItem(event.product, quantity);
      log(items.toString());
      emit(ItemAddToCartState(
          getItems, getQuantity(event.product), totalItems, totalAmount));
    });
    // on<ItemAddedtoCartEvent>((event, emit) {
    //   emit(ItemAddedToCartState(getItems, totalAmount));
    // });
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
  }

  int checkQuantity(int quantity) {
    log('quantity : $quantity');
    if ((_inCartItems + quantity) < 0) {
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        log('quantity : $_inCartItems');
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      log('quantity : $_inCartItems');
      return 20;
    } else {
      return quantity;
    }
  }

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = quantity;
        return ProductModel(
          id: value.id,
          name: value.name,
          price: value.price,
          imageLink: value.imageLink,
          quantity: totalQuantity,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return ProductModel(
            id: product.id,
            name: product.name,
            price: product.price,
            imageLink: product.imageLink,
            quantity: quantity,
          );
        });
      } else {}
    }
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<ProductModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total += (value.quantity! * double.parse(value.price!));
    });
    return total;
  }
}
