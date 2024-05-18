import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/models/product.dart';
import 'package:todoapp/core/components/textfield/custom_styles.dart';
import 'package:todoapp/view/products/product_list_view.dart';
import 'package:todoapp/viewmodel/product_viewmodel.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final ProductViewModel _productViewModel = Get.put(ProductViewModel());

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: customInputDecoration('Product Name'),
                validator: (val) => val!.isNotEmpty ? null : "Boş Bırakılamaz",
              ),

              const SizedBox(height: 8),
          
              TextFormField(
                controller: priceController,
                decoration: customInputDecoration('Price'),
                keyboardType: TextInputType.number,
                validator: (val) => val!.isNotEmpty ? null : "Boş Bırakılamaz",
              ),

              const SizedBox(height: 8),
          
              TextFormField(
                controller: imageController,
                decoration: customInputDecoration('Image Url'),
                validator: (val) => val!.isNotEmpty ? null : "Boş Bırakılamaz",
              ),

              const SizedBox(height: 16),
          
              ElevatedButton.icon(
                onPressed: () async{
                  if(formKey.currentState!.validate()){
                    var model = Product(
                      productName: nameController.text,
                      imageUrl: imageController.text,
                      money: int.parse(priceController.text),
                    );

                    await _productViewModel.addProducts(model);
                    Get.offAll(() => const ProductListView() );
                  }
                },
                icon: const Icon(Icons.send),
                label: const Text('Ekle'),
              )
            ],
          ),
        ),
      ),
    );
  }


}