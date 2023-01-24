import 'dart:developer';

import 'package:bloctest/logic/bloc/cart_bloc/cart_event.dart';
import 'package:bloctest/logic/bloc/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/product_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  final Map<int, ProductModel> _items = {};
  Map<int, ProductModel> get items => _items;

  CartBloc() : super(CartInitialState()) {
    on<IsIncrementEvent>((event, emit) {
      setQuantity(event.increment);
      emit(IsIncrementState(_quantity));
    });
    on<ItemAddToCartEvent>((event, emit) {
      addItem(event.product, _quantity);
      log(items.toString());
      _inCartItems = getQuantity(event.product);
      emit(ItemAddToCartState(
          getItems, _inCartItems, totalItems, double.parse(totalAmount)));
    });
    on<ItemAddedToCartEvent>((event, emit) {
      addItem(event.product, event.quantity);
      log(items.toString());
      emit(ItemAddedToCartState(getItems, getQuantity(event.product),
          totalItems, double.parse(totalAmount)));
    });
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      log(quantity.toString());
      log("updated");
      _items.update(product.id!, (value) {
        totalQuantity = quantity + value.quantity!;
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
        log("put is absent");
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
          log("value quantity ${value.quantity}");
          quantity = value.quantity!;
        }
      });
    }
    log("getQuantitty : $quantity");
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

  String get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total += (value.quantity! * double.parse(value.price!));
    });
    return total.toStringAsFixed(2);
  }
}
