import 'dart:convert';

import 'package:g10_demo/model/product_model.dart';
import 'package:g10_demo/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<Products>? products = <Products>[].obs;

  @override
  void onInit() {
    getProducts();
  }

  Future<void> getProducts() async {
    var jsonString =
        await RemoteServices.fetchProductList('https://dummyjson.com/products');
    if (jsonString != null) {
      print("json===$jsonString");
      ProductModel productModel = ProductModel.fromJson(jsonDecode(jsonString));
      products!.value = productModel.products!;
      print("products===$products");
    }
  }
}
