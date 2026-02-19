import 'package:yummy/features/orderHistory/data/order_model.dart';

class DummyOrderRepo {
  static List<OrderModel> orders = [];

  static void addOrder(OrderModel order) {
    orders.add(order);
  }
}