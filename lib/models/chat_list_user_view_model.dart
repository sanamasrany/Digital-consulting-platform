// To parse this JSON data, do
//
//     final chatListUserView = chatListUserViewFromJson(jsonString);

import 'dart:convert';

ChatListUserView chatListUserViewFromJson(String str) => ChatListUserView.fromJson(json.decode(str));

String chatListUserViewToJson(ChatListUserView data) => json.encode(data.toJson());

class ChatListUserView {
  ChatListUserView({
    required this.chat,
  });

  List<ChatUser> chat;

  factory ChatListUserView.fromJson(Map<String, dynamic> json) => ChatListUserView(
    chat: List<ChatUser>.from(json["chat"].map((x) => ChatUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "chat": List<dynamic>.from(chat.map((x) => x.toJson())),
  };
}

class ChatUser {
  ChatUser({
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
  Expert expert;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
    id: json["id"],
    userId: json["user_id"],
    expertId: json["expert_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expert: Expert.fromJson(json["expert"]),
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
