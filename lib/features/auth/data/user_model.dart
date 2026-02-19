class UserModel {

  final String name ;
  final String email;
  final String? image;
  final String? token;
  final String? address ;
  final String? visa ;


  UserModel({

    required this.name,
    required this.email,
    this.address,
    this.image,
    this.visa,
    this.token
  });

  factory UserModel.fromJason(Map<String , dynamic> jsonData){
    return UserModel(
      name: jsonData["name"] ?? "",
       email: jsonData["email"]?? "",
       token:jsonData["token"] ?? "",
       image: jsonData["image"] ?? "",
       address: jsonData["address"] ?? "",
       visa: jsonData["Visa"] ?? ""
       );
  }
}