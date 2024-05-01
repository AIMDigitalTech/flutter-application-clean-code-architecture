import '../../domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponseDto {
  LoginResponseModel(
      {required super.name,
      required super.iBan,
      required super.activationDate});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        name: json['name'],
        iBan: json['iBan'],
        activationDate: json['activationDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iBan': iBan,
      'activationDate': activationDate,
    };
  }
}
