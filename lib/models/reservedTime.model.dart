// To parse this JSON data, do
//
//     final expertReserved = expertReservedFromJson(jsonString);

import 'dart:convert';

ExpertReserved expertReservedFromJson(String str) => ExpertReserved.fromJson(json.decode(str));

String expertReservedToJson(ExpertReserved data) => json.encode(data.toJson());

class ExpertReserved {
  ExpertReserved({
    required this.reservedtime,
  });

  List<Reservedtime> reservedtime;

  factory ExpertReserved.fromJson(Map<String, dynamic> json) => ExpertReserved(
    reservedtime: List<Reservedtime>.from(json["reservedtime"].map((x) => Reservedtime.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "reservedtime": List<dynamic>.from(reservedtime.map((x) => x.toJson())),
  };
}

class Reservedtime {
  Reservedtime({
    required this.id,
    required this.startOfTimeReserved,
    required this.endOfTimeReserved,
    required this.numberOfDay,
    required this.expertId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  String startOfTimeReserved;
  String endOfTimeReserved;
  int numberOfDay;
  int expertId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory Reservedtime.fromJson(Map<String, dynamic> json) => Reservedtime(
    id: json["id"],
    startOfTimeReserved: json["start_of_time_reserved"],
    endOfTimeReserved: json["end_of_time_reserved"],
    numberOfDay: json["number_of_day"],
    expertId: json["expert_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_of_time_reserved": startOfTimeReserved,
    "end_of_time_reserved": endOfTimeReserved,
    "number_of_day": numberOfDay,
    "expert_id": expertId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.wallet,
    this.expertId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String phonenumber;
  int wallet;
  dynamic expertId;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phonenumber: json["phonenumber"],
    wallet: json["wallet"],
    expertId: json["expert_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "email": email,
    "phonenumber": phonenumber,
    "wallet": wallet,
    "expert_id": expertId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum Name { BAHAA, KAREEM, MOMO }

final nameValues = EnumValues({
  "bahaa": Name.BAHAA,
  "kareem": Name.KAREEM,
  "momo": Name.MOMO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
