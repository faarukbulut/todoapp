import 'package:get/get.dart';
import 'package:todoapp/core/constants/app_constants.dart';
import 'package:todoapp/models/products/product.dart';
import 'package:http/http.dart' as http;

class ProductViewModel extends GetxController{
  var isLoading = 0.obs;
  RxList<Product> productList = <Product>[].obs;
  Rx<Product> product = Product().obs;

  Future<void> listProducts() async{
    final response = await http.get(Uri.parse("${AppConstants.fireStoreUrl}/products?key=${AppConstants.key}"));

    if(response.statusCode == 200){
      final jsonResponse = productListFromJson(response.body);
      productList.clear();
      productList.assignAll(jsonResponse);
      isLoading(1);
    }
    else{
      isLoading(2);
    }
  }

  Future<void> getProduct(String docId) async{
    final response = await http.get(Uri.parse("${AppConstants.fireStoreUrl}/products/$docId?key=${AppConstants.key}"));

    if(response.statusCode == 200){
      product.value = productFromJson(response.body);
    }
  }

  Future<void> addProducts(Product product) async{
    await http.post(
      Uri.parse("${AppConstants.fireStoreUrl}/products?key=${AppConstants.key}"),
      body: productToJson(product)
    );
  }

  Future<void> deleteProduct(String docId) async{
    await http.delete(
      Uri.parse("${AppConstants.fireStoreUrl}/products/$docId?key=${AppConstants.key}"),
    );
  }

  Future<void> updateProduct(Product product) async{
    await http.patch(
      Uri.parse("${AppConstants.fireStoreUrl}/products/${product.docId}?key=${AppConstants.key}"),
      body: productToJson(product)
    );
  }

}