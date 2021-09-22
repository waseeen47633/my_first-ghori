// To parse this JSON data, do
//
//     final modelposts = modelpostsFromJson(jsonString);

import 'dart:convert';

List<Modelposts> modelpostsFromJson(String str) => List<Modelposts>.from(json.decode(str).map((x) => Modelposts.fromJson(x)));

String modelpostsToJson(List<Modelposts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modelposts {
  Modelposts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Modelposts.fromJson(Map<String, dynamic> json) => Modelposts(
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
