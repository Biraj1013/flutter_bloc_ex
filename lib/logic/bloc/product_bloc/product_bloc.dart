import 'package:bloctest/logic/bloc/product_bloc/product_event.dart';
import 'package:bloctest/logic/bloc/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/product_model.dart';
import '../../../../data/repositories/products_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
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
  }
}
