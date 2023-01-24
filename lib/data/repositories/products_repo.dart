import 'package:bloctest/data/repositories/api/api_services.dart';

import '../model/product_model.dart';
import 'api/api_constants.dart';

class ProductsRepository {
  ApiService api = ApiService();

  static List<ProductModel> products = [];

  Future<List<ProductModel>> fetchData() async {
    var url = ApiConstants.makeUpProductUri;

    try {
      var result = await api.get(url);
      List<dynamic> response = result;
      List<ProductModel> dataList =
          response.map((i) => ProductModel.fromJson(i)).toList();
      products = dataList;
      return dataList;
    } catch (e) {
      throw (e.toString());
    }
  }
}
