// To parse this JSON data, do
//
//     final editProfileModel = editProfileModelFromJson(jsonString);

class ProfileModel {
  final bool status;
  final String message;
  final ProfileModelData data;

  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json['status'],
        message: json['message'],
        data: ProfileModelData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
      };
}

class ProfileModelData {
  final int id;
  final String image;
  final String name;
  final int phone;
  final String email;

  ProfileModelData({
    required this.id,
    required this.image,
    required this.name,
    required this.phone,
    required this.email,
  });

  factory ProfileModelData.fromJson(Map<String, dynamic> json) => ProfileModelData(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'phone': phone,
        'email': email,
      };
}
