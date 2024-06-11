class ShowDoctorResponse {
  final bool status;
  final String message;
  final Data data;

  ShowDoctorResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowDoctorResponse.fromJson(Map<String, dynamic> json) => ShowDoctorResponse(
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
  final String name;
  final String image;
  final int cost;
  final String details;
  final String desc;
  final List<WorkingHour> workingHours;
  final List<Date> date;

  Data({
    required this.id,
    required this.name,
    required this.image,
    required this.cost,
    required this.details,
    required this.desc,
    required this.workingHours,
    required this.date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        cost: json['cost'],
        details: json['details'],
        desc: json['desc'],
        workingHours:
            List<WorkingHour>.from(json['working Hours'].map((x) => WorkingHour.fromJson(x))),
        date: List<Date>.from(json['Date'].map((x) => Date.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'cost': cost,
        'details': details,
        'desc': desc,
        'working Hours': List<dynamic>.from(workingHours.map((x) => x.toJson())),
        'Date': List<dynamic>.from(date.map((x) => x.toJson())),
      };
}

class Date {
  final String date;

  Date({required this.date});

  factory Date.fromJson(Map<String, dynamic> json) => Date(date: json['date']);

  Map<String, dynamic> toJson() => {'date': date};
}

class WorkingHour {
  final String time;

  WorkingHour({required this.time});

  factory WorkingHour.fromJson(Map<String, dynamic> json) => WorkingHour(time: json['time']);

  Map<String, dynamic> toJson() => {'time': time};
}
