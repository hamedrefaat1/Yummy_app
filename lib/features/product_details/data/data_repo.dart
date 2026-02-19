import 'package:yummy/features/product_details/data/topping_model.dart';

class DummyToppings {
  static List<ToppingModel> toppings = [
    ToppingModel(
      id: 1,
      image: "assets/toppingsImages/pngwing 15 (1).png",
      name: "Tomato",
    ),
    ToppingModel(
       id: 2,
      image: "assets/toppingsImages/pngwing 16.png", name: "Onions"),
    ToppingModel(
       id: 3,
      image: "assets/toppingsImages/pngwing 17.png",
      name: "Pickles",
    ),
    ToppingModel(
       id: 4,
      image: "assets/toppingsImages/pngwing 18.png", name: "Bacons"),
  ];
}

class DummyOptions{
     static List<ToppingModel>   options=[
     ToppingModel(
       id: 1,
      image: "assets/optionsImages/image 14.png",
      name: "Tomato",
    ),
    ToppingModel(
       id: 2,
      image: "assets/optionsImages/image 15.png", name: "Onions"),
    ToppingModel(
       id: 3,
      image: "assets/optionsImages/pngwing 14.png",
      name: "Pickles",
    ),
    ToppingModel(
       id: 4,
      image: "assets/optionsImages/pngwing 12 (1).png", name: "Bacons"),
     ];
}

class DetailsRepo {
  Future<List<ToppingModel>> getToppings() async {
    await Future.delayed(Duration(seconds: 1));
    return DummyToppings.toppings;
  }

  Future<List<ToppingModel>> getOptions()async{
    await Future.delayed(Duration(seconds: 1));
    return DummyOptions.options;
  }

}
