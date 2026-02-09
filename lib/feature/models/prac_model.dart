// To parse this JSON data, do
//
//     final pracModel = pracModelFromJson(jsonString);

import 'dart:convert';

List<PracModel> pracModelFromJson(String str) => List<PracModel>.from(json.decode(str).map((x) => PracModel.fromJson(x)));

String pracModelToJson(List<PracModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PracModel {
    int? userId;
    int? id;
    String? title;
    String? body;

    PracModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory PracModel.fromJson(Map<String, dynamic> json) => PracModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
