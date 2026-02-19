class ProductModel {
  int id;
  String name;
  String image;
  String desc;
  double price;
  String rate;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
    required this.rate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data["id"],
      name: data["name"],
      image: data["image"],
      desc: data["desc"],
      price: data["price"],
      rate: data["rate"],
    );
  }
}
