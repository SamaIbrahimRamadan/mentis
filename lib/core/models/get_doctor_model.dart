class GetDoctorResponse {
  final bool status;
  final String message;
  final List<Data> data;

  GetDoctorResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetDoctorResponse.fromJson(Map<String, dynamic> json) => GetDoctorResponse(
        status: json['status'],
        message: json['message'],
        data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  final int id;
  final String name;
  final String desc;
  final String image;
  final int rate;
  bool fav;

  Data({
    required this.id,
    required this.name,
    required this.desc,
    required this.image,
    required this.rate,
    required this.fav,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        name: json['name'],
        desc: json['desc'],
        image: json['image'],
        rate: json['rate'],
        fav: json['fav'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'desc': desc,
        'image': image,
        'rate': rate,
        'fav': fav,
      };
}
