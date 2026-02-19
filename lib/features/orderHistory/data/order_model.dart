import 'package:yummy/features/cart/data/cart_model.dart';

class OrderModel {
  final List<CartModel> items;
  final double totalPrice;
  final DateTime date;

  OrderModel({
    required this.items,
    required this.totalPrice,
    required this.date,
  });
}
