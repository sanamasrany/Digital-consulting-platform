// To parse this JSON data, do
//
//     final medical = medicalFromJson(jsonString);

import 'dart:convert';

Medical medicalFromJson(String str) => Medical.fromJson(json.decode(str));

String medicalToJson(Medical data) => json.encode(data.toJson());

class Medical {
  Medical({
    required this.medical,
  });

  List<MedicalElement> medical;

  factory Medical.fromJson(Map<String, dynamic> json) => Medical(
    medical: List<MedicalElement>.from(json["Medical"].map((x) => MedicalElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Medical": List<dynamic>.from(medical.map((x) => x.toJson())),
  };
}

class MedicalElement {
  MedicalElement({
    required this.id,
    required this.expertId,
    required this.consultationId,
    required this.timeOfConsultaionM,
    required this.costM,
    required this.createdAt,
    required this.updatedAt,
    required this.expert,
  });

  int id;
  int expertId;
  int consultationId;
  int timeOfConsultaionM;
  int costM;
  DateTime createdAt;
  DateTime updatedAt;
  ExpertM expert;

  factory MedicalElement.fromJson(Map<String, dynamic> json) => MedicalElement(
    id: json["id"],
    expertId: json["expert_id"],
    consultationId: json["consultation_id"],
    timeOfConsultaionM: json["time_of_consultaion_m"],
    costM: json["cost_m"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expert: ExpertM.fromJson(json["expert"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "expert_id": expertId,
    "consultation_id": consultationId,
    "time_of_consultaion_m": timeOfConsultaionM,
    "cost_m": costM,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "expert": expert.toJson(),
  };
}

class ExpertM {
  ExpertM({
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

  factory ExpertM.fromJson(Map<String, dynamic> json) => ExpertM(
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
    required this.mId,
    this.pId,
    this.fId,
    this.vId,
    this.bId,
    required this.expertId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int mId;
  dynamic pId;
  dynamic fId;
  dynamic vId;
  dynamic bId;
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
