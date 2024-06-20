class RecoverPasswordResponse {
  bool status;
  String message;
  String data;

  RecoverPasswordResponse({required this.status, required this.message, required this.data});

  factory RecoverPasswordResponse.fromJson(Map<String, dynamic> json) => RecoverPasswordResponse(
        status: json['status'],
        message: json['message'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
      };
}
