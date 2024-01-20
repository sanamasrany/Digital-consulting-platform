// To parse this JSON data, do
//
//     final day = dayFromJson(jsonString);

import 'dart:convert';

Day dayFromJson(String str) => Day.fromJson(json.decode(str));

String dayToJson(Day data) => json.encode(data.toJson());

class Day {
  Day({
    required this.day,
    required this.cost,
  });

  List<List<String>> day;
  int cost;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    day: List<List<String>>.from(json["day"].map((x) => List<String>.from(x.map((x) => x)))),
    cost: json["cost"],
  );

  Map<String, dynamic> toJson() => {
    "day": List<dynamic>.from(day.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "cost": cost,
  };
}
