


class ToppingModel {
  int id;
  String name ;
  String image;


  ToppingModel({
    required this.id,
    required this.image,
    required this.name
  });



  factory ToppingModel.fromJson(Map<String , dynamic> data){
         return ToppingModel(id: data["id"],  image: data["image"], name: data["name"]);
  }  
}