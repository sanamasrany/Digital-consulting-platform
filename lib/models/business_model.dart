// To parse this JSON data, do
//
//     final business = businessFromJson(jsonString);

import 'dart:convert';

Business businessFromJson(String str) => Business.fromJson(json.decode(str));

String businessToJson(Business data) => json.encode(data.toJson());

class Business {
  Business({
    required this.business,
  });

  List<BusinessElement> business;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    business: List<BusinessElement>.from(json["Business"].map((x) => BusinessElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Business": List<dynamic>.from(business.map((x) => x.toJson())),
  };
}

class BusinessElement {
  BusinessElement({
    required this.id,
    required this.expertId,
    required this.consultationId,
    required this.timeOfConsultaionB,
    required this.costB,
    required this.createdAt,
    required this.updatedAt,
    required this.expert,
  });

  int id;
  int expertId;
  int consultationId;
  int timeOfConsultaionB;
  int costB;
  DateTime createdAt;
  DateTime updatedAt;
  ExpertB expert;

  factory BusinessElement.fromJson(Map<String, dynamic> json) => BusinessElement(
    id: json["id"],
    expertId: json["expert_id"],
    consultationId: json["consultation_id"],
    timeOfConsultaionB: json["time_of_consultaion_b"],
    costB: json["cost_b"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expert: ExpertB.fromJson(json["expert"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "expert_id": expertId,
    "consultation_id": consultationId,
    "time_of_consultaion_b": timeOfConsultaionB,
    "cost_b": costB,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "expert": expert.toJson(),
  };
}

class ExpertB {
  ExpertB({
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
    required this.consultation,
  });

  int id;
  var name;
  var email;
  var imgpath;
  var phonenumber;
  var address;
  var valueOfRating;
  int userId;
  var experinces;
  var wallet;
  DateTime createdAt;
  DateTime updatedAt;
  Time time;
  Consultation consultation;

  factory ExpertB.fromJson(Map<String, dynamic> json) => ExpertB(
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
    consultation: Consultation.fromJson(json["consultation"]),
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
    "consultation": consultation.toJson(),
  };
}

class Consultation {
  Consultation({
    required this.id,
    this.mId,
    this.pId,
    this.fId,
    this.vId,
    required this.bId,
    required this.expertId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  dynamic mId;
  dynamic pId;
  dynamic fId;
  dynamic vId;
  int bId;
  int expertId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
    id: json["id"],
    mId: json["m_id"],
    pId: json["p_id"],
    fId: json["f_id"],
    vId: json["v_id"],
    bId: json["b_id"],
    expertId: json["expert_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "m_id": mId,
    "p_id": pId,
    "f_id": fId,
    "v_id": vId,
    "b_id": bId,
    "expert_id": expertId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
  var sundayS;
  var sundayE;
  var mondayS;
  var mondayE;
  var tuesdayS;
  var tuesdayE;
  var wednesdayS;
  var wednesdayE;
  var thursdayS;
  var thursdayE;
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
