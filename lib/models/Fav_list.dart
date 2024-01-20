// To parse this JSON data, do
//
//     final favoretlist = favoretlistFromJson(jsonString);

import 'dart:convert';

Favoretlist favoretlistFromJson(String str) => Favoretlist.fromJson(json.decode(str));

String favoretlistToJson(Favoretlist data) => json.encode(data.toJson());

class Favoretlist {
  Favoretlist({
    required this.favlist,
  });

  List<Favlist> favlist;

  factory Favoretlist.fromJson(Map<String, dynamic> json) => Favoretlist(
    favlist: List<Favlist>.from(json["favlist"].map((x) => Favlist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "favlist": List<dynamic>.from(favlist.map((x) => x.toJson())),
  };
}

class Favlist {
  Favlist({
    required this.id,
    required this.userId,
    required this.expertId,
    required this.createdAt,
    required this.updatedAt,
    required this.expert,
  });

  int id;
  int userId;
  int expertId;
  DateTime createdAt;
  DateTime updatedAt;
  FavExpert expert;

  factory Favlist.fromJson(Map<String, dynamic> json) => Favlist(
    id: json["id"],
    userId: json["user_id"],
    expertId: json["expert_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expert: FavExpert.fromJson(json["expert"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "expert_id": expertId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "expert": expert.toJson(),
  };
}

class FavExpert {
  FavExpert({
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

  factory FavExpert.fromJson(Map<String, dynamic> json) => FavExpert(
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
