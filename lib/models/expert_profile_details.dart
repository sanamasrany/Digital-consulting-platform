// To parse this JSON data, do
//
//     final expertProfile = expertProfileFromJson(jsonString);

import 'dart:convert';

ExpertProfile expertProfileFromJson(String str) => ExpertProfile.fromJson(json.decode(str));

String expertProfileToJson(ExpertProfile data) => json.encode(data.toJson());

class ExpertProfile {
  ExpertProfile({
    required this.expert,

  });

  Expert expert;


  factory ExpertProfile.fromJson(Map<String, dynamic> json) => ExpertProfile(
    expert: Expert.fromJson(json["expert"]),

  );

  Map<String, dynamic> toJson() => {
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
    required this.time,
  });

  int id;
  String name;
  String email;
  String imgpath;
  String phonenumber;
  String address;
  var valueOfRating;
  int userId;
  String experinces;
  int wallet;
  DateTime createdAt;
  DateTime updatedAt;
  Time time;

  factory Expert.fromJson(Map<String, dynamic> json) => Expert(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    imgpath: json["imgpath"],
    phonenumber: json["phonenumber"],
    address: json["address"],
    valueOfRating: json["value_of_rating"],
    userId: json["user_id"],
    experinces: json["experinces"],
    wallet: json["wallet"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    time: Time.fromJson(json["time"]),
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
    "time": time.toJson(),
  };
}

class Time {
  Time({
    required this.id,
    required this.sundayS,
    required this.sundayE,
    required this.mondayS,
    required this.mondayE,
    required this.tuesdayS,
    required this.tuesdayE,
    required this.wednesdayS,
    required this.wednesdayE,
    required this.thursdayS,
    required this.thursdayE,
    required this.expertId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String sundayS;
  String sundayE;
  String mondayS;
  String mondayE;
  String tuesdayS;
  String tuesdayE;
  String wednesdayS;
  String wednesdayE;
  String thursdayS;
  String thursdayE;
  int expertId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    id: json["id"],
    sundayS: json["sundayS"],
    sundayE: json["sundayE"],
    mondayS: json["mondayS"],
    mondayE: json["mondayE"],
    tuesdayS: json["tuesdayS"],
    tuesdayE: json["tuesdayE"],
    wednesdayS: json["wednesdayS"],
    wednesdayE: json["wednesdayE"],
    thursdayS: json["thursdayS"],
    thursdayE: json["thursdayE"],
    expertId: json["expert_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sundayS": sundayS,
    "sundayE": sundayE,
    "mondayS": mondayS,
    "mondayE": mondayE,
    "tuesdayS": tuesdayS,
    "tuesdayE": tuesdayE,
    "wednesdayS": wednesdayS,
    "wednesdayE": wednesdayE,
    "thursdayS": thursdayS,
    "thursdayE": thursdayE,
    "expert_id": expertId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
