class UserModelResponse {
  final int status;
  final String message;
  final UserModel? data;

  UserModelResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  UserModelResponse copyWith({int? status, String? message, UserModel? user}) => UserModelResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: user ?? data,
      );

  factory UserModelResponse.fromJson(Map<String, dynamic> json) => UserModelResponse(
        status: json['status'],
        message: json['message'],
        data: json['data'] == null ? null : UserModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}

class UserModel {
  final Student student;
  final Settings settings;
  final AccessToken accessToken;

  UserModel({
    required this.student,
    required this.settings,
    required this.accessToken,
  });

  UserModel copyWith({
    Student? student,
    Settings? settings,
    AccessToken? accessToken,
  }) =>
      UserModel(
        student: student ?? this.student,
        settings: settings ?? this.settings,
        accessToken: accessToken ?? this.accessToken,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        student: Student.fromJson(json['student']),
        settings: Settings.fromJson(json['settings']),
        accessToken: AccessToken.fromJson(json['access_token']),
      );

  Map<String, dynamic> toJson() => {
        'student': student.toJson(),
        'settings': settings.toJson(),
        'access_token': accessToken.toJson(),
      };
}

class AccessToken {
  final String token;
  final String tokenType;
  final DateTime expiresAt;

  AccessToken({
    required this.token,
    required this.tokenType,
    required this.expiresAt,
  });

  AccessToken copyWith({
    String? token,
    String? tokenType,
    DateTime? expiresAt,
  }) =>
      AccessToken(
        token: token ?? this.token,
        tokenType: tokenType ?? this.tokenType,
        expiresAt: expiresAt ?? this.expiresAt,
      );

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        token: json['token'],
        tokenType: json['token_type'],
        expiresAt: DateTime.parse(json['expires_at']),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'token_type': tokenType,
        'expires_at': expiresAt.toIso8601String(),
      };
}

class Settings {
  final bool completedProfile;
  final bool banned;
  final bool summerMode;

  Settings({
    required this.completedProfile,
    required this.banned,
    required this.summerMode,
  });

  Settings copyWith({
    bool? completedProfile,
    bool? banned,
    bool? summerMode,
  }) =>
      Settings(
        completedProfile: completedProfile ?? this.completedProfile,
        banned: banned ?? this.banned,
        summerMode: summerMode ?? this.summerMode,
      );

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        completedProfile: json['completed_profile'],
        banned: json['banned'],
        summerMode: json['summer_mode'],
      );

  Map<String, dynamic> toJson() => {
        'completed_profile': completedProfile,
        'banned': banned,
        'summer_mode': summerMode,
      };
}

class Student {
  final int id;
  final String firstName;
  final String lastName;
  final String name;
  final String mobile;
  final String signature;
  final String mobileCountryLabel;
  final String mobileCode;
  final DateTime birthDate;
  final String graduateDate;
  final String image;
  final String avatar;
  final String gender;
  final bool isOnline;
  final String lastSeen;
  final String educationLevel;
  final City? stage;
  final Level? level;
  final City? country;

  final City? governorate;

  final City? city;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.mobile,
    required this.signature,
    required this.mobileCountryLabel,
    required this.mobileCode,
    required this.country,
    required this.governorate,
    required this.city,
    required this.birthDate,
    required this.graduateDate,
    required this.image,
    required this.avatar,
    required this.gender,
    required this.isOnline,
    required this.lastSeen,
    required this.educationLevel,
    this.stage,
    required this.level,
  });

  Student copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? name,
    String? mobile,
    String? signature,
    String? mobileCountryLabel,
    String? mobileCode,
    City? country,
    City? governorate,
    City? city,
    DateTime? birthDate,
    String? graduateDate,
    String? image,
    String? avatar,
    String? gender,
    bool? isOnline,
    String? lastSeen,
    String? educationLevel,
    City? stage,
    Level? level,
  }) =>
      Student(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        signature: signature ?? this.signature,
        mobileCountryLabel: mobileCountryLabel ?? this.mobileCountryLabel,
        mobileCode: mobileCode ?? this.mobileCode,
        country: country ?? this.country,
        governorate: governorate ?? this.governorate,
        city: city ?? this.city,
        birthDate: birthDate ?? this.birthDate,
        graduateDate: graduateDate ?? this.graduateDate,
        image: image ?? this.image,
        avatar: avatar ?? this.avatar,
        gender: gender ?? this.gender,
        isOnline: isOnline ?? this.isOnline,
        lastSeen: lastSeen ?? this.lastSeen,
        educationLevel: educationLevel ?? this.educationLevel,
        stage: stage ?? this.stage,
        level: level ?? this.level,
      );

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        name: json['name'],
        mobile: json['mobile'],
        signature: json['signature'],
        mobileCountryLabel: json['mobile_country_label'],
        mobileCode: json['mobile_code'],
        birthDate: DateTime.parse(json['birth_date']),
        graduateDate: json['graduate_date'],
        image: json['image'],
        avatar: json['avatar'],
        gender: json['gender'],
        isOnline: json['is_online'],
        lastSeen: json['last_seen'],
        educationLevel: json['education_level'],
        stage: json['stage'] == {} ? null : City.fromJson(json['stage']),
        level: json['level'] == {} ? null : Level.fromJson(json['level']),
        country: json['country'] == {} ? null : City.fromJson(json['country']),
        governorate: json['governorate'] == null ? null : City.fromJson(json['governorate']),
        city: json['city'] == null ? null : City.fromJson(json['city']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'name': name,
        'mobile': mobile,
        'signature': signature,
        'mobile_country_label': mobileCountryLabel,
        'mobile_code': mobileCode,
        'birth_date':
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        'graduate_date': graduateDate,
        'image': image,
        'avatar': avatar,
        'gender': gender,
        'is_online': isOnline,
        'last_seen': lastSeen,
        'education_level': educationLevel,
        'stage': stage?.toJson(),
        'level': level?.toJson(),
        'country': country?.toJson(),
        'governorate': governorate?.toJson(),
        'city': city?.toJson(),
      };
}

class City {
  final int? id;
  final String? name;
  final String? stName;

  City({
    this.id,
    this.name,
    this.stName,
  });

  City copyWith({
    int? id,
    String? name,
    String? stName,
  }) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
        stName: stName ?? this.stName,
      );

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'],
        name: json['name'],
        stName: json['st_name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'st_name': stName,
      };
}

class Level {
  final int? id;
  final City? university;
  final City? stage;
  final City? grade;

  Level({
    this.id,
    this.university,
    this.stage,
    this.grade,
  });

  Level copyWith({
    int? id,
    City? university,
    City? stage,
    City? grade,
  }) =>
      Level(
        id: id ?? this.id,
        university: university ?? this.university,
        stage: stage ?? this.stage,
        grade: grade ?? this.grade,
      );

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json['id'],
        university: json['university'] == null ? null : City.fromJson(json['university']),
        stage: json['stage'] == null ? null : City.fromJson(json['stage']),
        grade: json['grade'] == null ? null : City.fromJson(json['grade']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'university': university?.toJson(),
        'stage': stage?.toJson(),
        'grade': grade?.toJson(),
      };
}
