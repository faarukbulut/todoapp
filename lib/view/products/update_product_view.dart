import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/core/components/buton/custom_buton.dart';
import 'package:todoapp/models/products/product.dart';
import 'package:todoapp/core/components/textfield/custom_styles.dart';
import 'package:todoapp/view/products/product_list_view.dart';
import 'package:todoapp/viewmodel/product_viewmodel.dart';

class UpdateProductView extends StatefulWidget {
  final String docId;
  const UpdateProductView({super.key, required this.docId});

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  final ProductViewModel _productViewModel = Get.put(ProductViewModel());

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async{
    await _productViewModel.getProduct(widget.docId);
    await loadFormData();
  }

  loadFormData(){
    nameController.text = _productViewModel.product.value.productName!;
    priceController.text = _productViewModel.product.value.money.toString();
    imageController.text = _productViewModel.product.value.imageUrl!;
  }

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
          
              iconElevatedButon(
                () async{
                  if(formKey.currentState!.validate()){
                    var model = Product(
                      docId: widget.docId,
                      productName: nameController.text,
                      imageUrl: imageController.text,
                      money: int.parse(priceController.text),
                    );

                    await _productViewModel.updateProduct(model);
                    Get.offAll(() => const ProductListView() );
                  }
                },
                Icons.edit,
                'Güncelle'
              ),
            ],
          ),
        ),
      ),
    );
  }


}