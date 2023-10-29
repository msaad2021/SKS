import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.info,
  });

  Info? info;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "info": info!.toJson(),
      };
}

class Info {
  Info({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.department,
    this.designation,
    this.mobileNumber,
    this.countryCode,
    this.isPasswordForgot,
    this.profileImage,
  });

  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? department;
  String? designation;
  String? mobileNumber;
  dynamic? countryCode;
  bool? isPasswordForgot;
  String? profileImage;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        department: json["department"],
        designation: json["designation"],
        mobileNumber: json["mobileNumber"],
        countryCode: json["countryCode"],
        isPasswordForgot: json["isPasswordForgot"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "department": department,
        "designation": designation,
        "mobileNumber": mobileNumber,
        "countryCode": countryCode,
        "isPasswordForgot": isPasswordForgot,
        "profileImage": profileImage,
      };
}
