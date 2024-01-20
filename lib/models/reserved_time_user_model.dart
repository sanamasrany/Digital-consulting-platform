// To parse this JSON data, do
//
//     final reservedTimeuUser = reservedTimeuUserFromJson(jsonString);

import 'dart:convert';

ReservedTimeuUser reservedTimeuUserFromJson(String str) => ReservedTimeuUser.fromJson(json.decode(str));

String reservedTimeuUserToJson(ReservedTimeuUser data) => json.encode(data.toJson());

class ReservedTimeuUser {
  ReservedTimeuUser({
    required this.reservedtime,
  });

  List<Reservedtime> reservedtime;

  factory ReservedTimeuUser.fromJson(Map<String, dynamic> json) => ReservedTimeuUser(
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
    required this.expert,
  });

  int id;
  String startOfTimeReserved;
  String endOfTimeReserved;
  int numberOfDay;
  int expertId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  Expert expert;

  factory Reservedtime.fromJson(Map<String, dynamic> json) => Reservedtime(
    id: json["id"],
    startOfTimeReserved: json["start_of_time_reserved"],
    endOfTimeReserved: json["end_of_time_reserved"],
    numberOfDay: json["number_of_day"],
    expertId: json["expert_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expert: Expert.fromJson(json["expert"]),
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
    "expert": expert.toJson(),
  };
}

class Expert {
  Expert({
    required this.id,
    required this.name,
    required this.email,
    required this.imgpath,
    required this.phonenumber,
    required this.address,
    required this.valueOfRating,
    required this.userId,
    required this.experinces,
    required this.wallet,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String imgpath;
  String phonenumber;
  String address;
  double valueOfRating;
  int userId;
  String experinces;
  int wallet;
  DateTime createdAt;
  DateTime updatedAt;

  factory Expert.fromJson(Map<String, dynamic> json) => Expert(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    imgpath: json["imgpath"],
    phonenumber: json["phonenumber"],
    address: json["address"],
    valueOfRating: json["value_of_rating"]?.toDouble(),
    userId: json["user_id"],
    experinces: json["experinces"],
    wallet: json["wallet"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "imgpath": imgpath,
    "phonenumber": phonenumber,
    "address": address,
    "value_of_rating": valueOfRating,
    "user_id": userId,
    "experinces": experinces,
    "wallet": wallet,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
