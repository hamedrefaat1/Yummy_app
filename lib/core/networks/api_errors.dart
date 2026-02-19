class ApiErrors {
  final String message;
  final int? statusCode;

  ApiErrors({required this.message, this.statusCode});

  String returnError(){
    return "Error is $message";
  }
}
