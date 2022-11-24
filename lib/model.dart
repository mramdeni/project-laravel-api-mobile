import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

class Article {
  Article({
    required this.success,
    required this.data,
  });

  bool success;
  List<Data> data;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        success: json["success"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );
}

class Data {
  Data({
    required this.teks,
  });

  String teks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        teks: json["teks"],
      );

  Map<String, dynamic> toJson() => {
        "teks": teks,
      };
}
