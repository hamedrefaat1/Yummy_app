import 'package:yummy/features/home/data/product_model.dart';

class CartModel {
  final ProductModel product;
   int qty;
  final double spicy;
  List<int> toppings;
  List<int> options;

  CartModel({
    required this.product,
    required this.qty,
    required this.spicy,
    required this.toppings,
    required this.options,
  });

  Map<String, dynamic> toJson() => {
    "productId": product,
    "qty": qty,
    "spicy": spicy,
    "toppings": toppings,
    "options": options,
  };
}
