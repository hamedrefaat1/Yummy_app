

import 'package:yummy/features/home/data/product_model.dart';

class DummyProducts {
  static List<ProductModel> products = [
    ProductModel(
      id: 1,
      name: "Classic Beef Burger",
      image: "assets/productsImages/burger.png",
      desc: "Juicy grilled beef patty with cheddar cheese, lettuce, and our special sauce.",
      price: 120,
      rate: "4.5",
    ),
    ProductModel(
      id: 2,
      name: "Double Cheese Burger",
      image: "assets/productsImages/burger1.png",
      desc: "Two beef patties layered with melted cheddar cheese and fresh veggies.",
      price: 165,
      rate: "4.8",
    ),
    ProductModel(
      id: 3,
      name: "BBQ Bacon Burger",
      image: "assets/productsImages/burger2.png",
      desc: "Smoky BBQ sauce with crispy beef bacon and grilled onions.",
      price: 150,
      rate: "4.6",
    ),
    ProductModel(
      id: 4,
      name: "Spicy Jalapeño Burger",
      image: "assets/productsImages/testImage.png",
      desc: "Spicy beef burger topped with jalapeños and pepper jack cheese.",
      price:140, 
      rate: "4.4",
    ),
    ProductModel(
      id: 5,
      name: "Mushroom Swiss Burger",
      image: "assets/productsImages/burger.png",
      desc: "Grilled mushrooms with melted Swiss cheese on a premium bun.",
      price: 155,
      rate: "4.7",
    ),
    ProductModel(
      id: 6,
      name: "Crispy Chicken Burger",
      image: "assets/productsImages/burger1.png",
      desc: "Golden crispy chicken fillet with lettuce and garlic mayo.",
      price: 130,
      rate: "4.3",
    ),
  ];
}


class HomeRepo {

  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(Duration(seconds: 1)); 
    return DummyProducts.products;
  }

}