import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/view/products/product_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration(seconds: 0),
      debugShowCheckedModeBanner: false,
      home: ProductListView(),
    );
  }
}

