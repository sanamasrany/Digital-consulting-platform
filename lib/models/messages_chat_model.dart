// To parse this JSON data, do
//
//     final chatMessages = chatMessagesFromJson(jsonString);

import 'dart:convert';

ChatMessages chatMessagesFromJson(String str) => ChatMessages.fromJson(json.decode(str));

String chatMessagesToJson(ChatMessages data) => json.encode(data.toJson());

class ChatMessages {
  ChatMessages({
    required this.messagesofchat,
  });

  List<Messagesofchat> messagesofchat;

  factory ChatMessages.fromJson(Map<String, dynamic> json) => ChatMessages(
    messagesofchat: List<Messagesofchat>.from(json["messagesofchat"].map((x) => Messagesofchat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "messagesofchat": List<dynamic>.from(messagesofchat.map((x) => x.toJson())),
  };
}

class Messagesofchat {
  Messagesofchat({
    required this.id,
    required this.userId,
    required this.expertId,
    required this.message,
    required this.fromUser,
    required this.fromExpert,
    required this.chatId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  int expertId;
  String message;
  int fromUser;
  int fromExpert;
  int chatId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Messagesofchat.fromJson(Map<String, dynamic> json) => Messagesofchat(
    id: json["id"],
    userId: json["user_id"],
    expertId: json["expert_id"],
    message: json["message"],
    fromUser: json["from_user"],
    fromExpert: json["from_expert"],
    chatId: json["chat_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "expert_id": expertId,
    "message": message,
    "from_user": fromUser,
    "from_expert": fromExpert,
    "chat_id": chatId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
