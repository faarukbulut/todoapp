import 'dart:convert';

List<Product> productListFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Product>.from(jsonData["documents"].map((x) => Product.fromJson(x)));
}

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String? docId;
  String? imageUrl;
  String? productName;
  int? money;

  Product({
    this.docId,
    this.imageUrl,
    this.productName,
    this.money,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    docId: json["name"].split('/').last ?? "",
    imageUrl: json["fields"]["imageUrl"]["stringValue"] ?? "",
    productName: json["fields"]["productName"]["stringValue"] ?? "",
    money: int.tryParse(json["fields"]["money"]["integerValue"]) ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "fields": {
      "imageUrl": {"stringValue": imageUrl},
      "productName": {"stringValue": productName},
      "money": {"integerValue": money.toString()},
    },
  };
}
