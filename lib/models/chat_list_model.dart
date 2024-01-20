// To parse this JSON data, do
//
//     final chatList = chatListFromJson(jsonString);

import 'dart:convert';

ChatList chatListFromJson(String str) => ChatList.fromJson(json.decode(str));

String chatListToJson(ChatList data) => json.encode(data.toJson());

class ChatList {
  ChatList({
    required this.chat,
  });

  List<Chat> chat;

  factory ChatList.fromJson(Map<String, dynamic> json) => ChatList(
    chat: List<Chat>.from(json["chat"].map((x) => Chat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "chat": List<dynamic>.from(chat.map((x) => x.toJson())),
  };
}

class Chat {
  Chat({
    required this.id,
    required this.userId,
    required this.expertId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  int userId;
  int expertId;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"],
    userId: json["user_id"],
    expertId: json["expert_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "expert_id": expertId,
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
    "name": name,
    "email": email,
    "phonenumber": phonenumber,
    "wallet": wallet,
    "expert_id": expertId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
