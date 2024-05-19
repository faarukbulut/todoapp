import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/core/components/buton/custom_buton.dart';
import 'package:todoapp/core/components/card/custom_card.dart';
import 'package:todoapp/core/services/firebase_auth.dart';
import 'package:todoapp/models/products/product.dart';
import 'package:todoapp/view/products/add_product_view.dart';
import 'package:todoapp/view/products/update_product_view.dart';
import 'package:todoapp/viewmodel/product_viewmodel.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final ProductViewModel _productViewModel = Get.put(ProductViewModel());

  @override
  void initState() {
    super.initState();
    _productViewModel.listProducts();
    print(AuthService.instance.cUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Todo')
      ),
      body: Obx((){
        if(_productViewModel.isLoading.value == 0){
          return const Center(child: CircularProgressIndicator());
        }
        else if(_productViewModel.isLoading.value == 2){
          return const Center(child: Text('Veri alınırken hata oluştu.'));
        }
        else{
          return buildListView();
        }
      }),
      floatingActionButton: buildActionButton(),
    );
  }

  buildListView() {
    return ListView.builder(
      itemCount: _productViewModel.productList.length,
      itemBuilder: (context, i){
        return GestureDetector(
          onLongPress: (){
            detailProductshowModalBottom(_productViewModel.productList[i]);
          },
          child: CustomCard(
            title: _productViewModel.productList[i].productName!, 
            subtitle: _productViewModel.productList[i].money.toString(), 
            imageUrl: _productViewModel.productList[i].imageUrl!
          ),
        );
      },
    );
  }

  buildActionButton() {
    return FloatingActionButton(
      onPressed: (){ addProductshowModalBottom(); },
      child: const Icon(Icons.add),
    );
  }

  void addProductshowModalBottom(){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              normalElevatedButon(
                (){
                  Get.back();
                  Get.to(() => const AddProductView());
                },
                Colors.indigo,
                'Add Product'
              ),
            ],
          ),
        );
      },
    );
  }

  void detailProductshowModalBottom(Product product){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              normalElevatedButon(
                (){
                  Get.back();
                  Get.to(() => UpdateProductView(docId: product.docId!));
                },
                Colors.green,
                'Update Product'
              ),

              normalElevatedButon(
                () async{
                  Get.back();
                  await _productViewModel.deleteProduct(product.docId!);
                  Get.offAll(() => const ProductListView());
                },
                Colors.red,
                'Delete Product'
              ),

            ],
          ),
        );
      },
    );  
  }

}