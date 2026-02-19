import 'package:yummy/features/cart/data/cart_model.dart';

class DummyDataCart{
 static List<CartModel> items=[
      
  ];
}

class CartRepo{


  Future<void> addProductToCart(CartModel product)async{
    await Future.delayed(Duration(seconds: 1));
     DummyDataCart.items.add(product);
  }
}