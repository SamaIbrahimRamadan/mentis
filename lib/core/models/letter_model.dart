class LetterModelResponse {
  bool? status;
  String? code;
  List<LetterModelData>? data;

  LetterModelResponse({this.status, this.code, this.data});

  LetterModelResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data = <LetterModelData>[];
      json['data'].forEach((v) {
        data!.add(LetterModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LetterModelData {
  String? image;
  String? text;

  LetterModelData({this.image, this.text});

  LetterModelData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['text'] = text;
    return data;
  }
}
