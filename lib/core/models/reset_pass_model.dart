class ResetPassResponse {
  final bool status;
  final String message;
  final Data data;

  ResetPassResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResetPassResponse.fromJson(Map<String, dynamic> json) => ResetPassResponse(
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
  final String phone;
  final String email;
  final String code;
  final String notificationStatus;

  Data({
    required this.id,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.code,
    required this.notificationStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        image: json['image'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        phone: json['phone'],
        email: json['email'],
        code: json['code'],
        notificationStatus: json['notification_status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'email': email,
        'code': code,
        'notification_status': notificationStatus,
      };
}
