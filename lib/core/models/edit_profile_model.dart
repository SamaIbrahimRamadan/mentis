// To parse this JSON data, do
//
//     final editProfileModel = editProfileModelFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) =>
    EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  final bool status;
  final String message;
  final Data data;

  EditProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
        status: json['status'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
      };
}

class Data {
  final int id;
  final String image;
  final String firstName;
  final String lastName;
  final int phone;
  final String email;

  Data({
    required this.id,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        image: json['image'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        phone: json['phone'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'email': email,
      };
}
