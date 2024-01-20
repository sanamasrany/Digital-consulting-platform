// class Expert {
//
//   String? name ;
//   String? email;
//   String? password ;
//   String? passwordConfirm;
//   String? details;
//   String? imageurl ;
//   var selectEdxperiences ;
//   int? phone ;
//   String? address;
//   Map<String,int> ?times ;
//   int ? rate ;
//   int ? cost ;
//
//
//   Expert({
//     this.name,
//     this.email,
//     this.password,
//     this.passwordConfirm,
//     this.details,
//     this.selectEdxperiences,
//     this.phone,
//     this.address,
//     this.times,
//     this.imageurl,
//   this.rate,
//     this.cost,
//   });
//
// }
// List<Expert> expertlist = [
//
//   Expert(
//       name: 'Milk ',
//       imageurl: 'assets/images/milk.jpg',
//     rate: 3,
//       cost: 2000,
//
//   )  ,
//    Expert(
//       name: 'Chocolate ',
//       imageurl: 'assets/images/choco.jpg',
//      rate: 2,
//      cost: 5000,
//      details: "dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum"
//   ),
//
//
// ];
// To parse this JSON data, do
//
//     final expert = expertFromJson(jsonString);

// import 'dart:convert';
//
// Expert expertFromJson(String str) => Expert.fromJson(json.decode(str));
//
// String expertToJson(Expert data) => json.encode(data.toJson());
//
// class Expert {
//   Expert({
//     required this.experts,
//   });
//
//   List<ExpertElement> experts;
//
//   factory Expert.fromJson(Map<String, dynamic> json) => Expert(
//     experts: List<ExpertElement>.from(json["experts"].map((x) => ExpertElement.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "experts": List<dynamic>.from(experts.map((x) => x.toJson())),
//   };
// }
//
// class ExpertElement {
//   ExpertElement({
//     required this.id,
//     required this.name,
//     required  this.email,
//     required  this.password,
//     required this.imgpath,
//     required this.phonenumber,
//     required  this.address,
//     required this.valueOfRating,
//     required this.userId,
//     required this.experinces,
//     required this.wallet,
//     required  this.createdAt,
//     required this.updatedAt,
//     required  this.consultation,
//     required this.details,
//   required this.starttime,
//   required this.endtime,
//   required this.durantion,
//     required this.cost,
//   });
//
//   int id;
//   String name;
//   String email;
//   String password;
//   dynamic imgpath;
//   String phonenumber;
//   String address;
//   int valueOfRating;
//   dynamic userId;
//   String experinces;
//   String details;
//   int wallet;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int starttime;
//   int endtime;
//   int durantion;
//   Consultation consultation;
//   int cost ;
//
//   factory ExpertElement.fromJson(Map<String, dynamic> json) => ExpertElement(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     password: json["password"],
//     imgpath: json["imgpath"],
//     phonenumber: json["phonenumber"],
//     address: json["address"],
//     valueOfRating: json["rate"],
//     userId: json["user_id"],
//     experinces: json["experinces"],
//     details: json["details"],
//     wallet: json["wallet"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   //  time: Time.fromJson(json["time"]),
//     starttime: json["starttime"],
//     endtime: json["endtime"],
//     durantion:  json["duration"],
//     cost: json["cost"],
//     consultation: Consultation.fromJson(json["consultation"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "imgpath": imgpath,
//     "phonenumber": phonenumber,
//     "address": address,
//     "value_of_rating": valueOfRating,
//     "user_id": userId,
//     "experinces": experinces,
//     "wallet": wallet,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     //"time": time.toJson(),
//     "consultation": consultation.toJson(),
//   };
// }
//
// class Consultation {
//   Consultation({
//     required   this.id,
//     required  this.mId,
//     required this.pId,
//     required this.fId,
//     required this.vId,
//     required this.bId,
//     required this.expertId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   int mId;
//   dynamic pId;
//   int fId;
//   int vId;
//   dynamic bId;
//   int expertId;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
//     id: json["id"],
//     mId: json["m_id"],
//     pId: json["p_id"],
//     fId: json["f_id"],
//     vId: json["v_id"],
//     bId: json["b_id"],
//     expertId: json["expert_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "m_id": mId,
//     "p_id": pId,
//     "f_id": fId,
//     "v_id": vId,
//     "b_id": bId,
//     "expert_id": expertId,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class Time {
//   Time({
//     required this.id,
//     required this.sunday,
//     required this.monday,
//     required this.tuesday,
//     required this.wednesday,
//     required  this.thursday,
//     required this.cost,
//     required this.expertId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   String sunday;
//   String monday;
//   String tuesday;
//   String wednesday;
//   String thursday;
//   int cost;
//   int expertId;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Time.fromJson(Map<String, dynamic> json) => Time(
//     id: json["id"],
//     sunday: json["sunday"],
//     monday: json["monday"],
//     tuesday: json["tuesday"],
//     wednesday: json["wednesday"],
//     thursday: json["thursday"],
//     cost: json["cost"],
//     expertId: json["expert_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "sunday": sunday,
//     "monday": monday,
//     "tuesday": tuesday,
//     "wednesday": wednesday,
//     "thursday": thursday,
//     "cost": cost,
//     "expert_id": expertId,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }

// To parse this JSON data, do
//
//     final expert = expertFromJson(jsonString);

// To parse this JSON data, do
//
//     final expert = expertFromJson(jsonString);

// import 'dart:convert';
//
//
//
// class Expert {
//   Expert({
//     this.name,
//     this.email,
//     this.imgpath,
//     this.phonenumber,
//     this.address,
//     this.experinces,
//     this.details,
//     this.starttime,
//     this.endtime,
//     this.duration,
//     this.password,
//     this.cost,
//     this.wallet,
//     this.updatedAt,
//     this.createdAt,
//     this.id,
//     this.rate,
//   });
//
//   String? name;
//   String? email;
//   String? imgpath;
//   String? phonenumber;
//   String? address;
//   String? experinces;
//   String? details;
//   String? starttime;
//   String? endtime;
//   String? duration;
//   DateTime? updatedAt;
//   DateTime? createdAt;
//   int ? wallet;
//   int ? cost ;
//   String ? password;
//   int? id;
//   int ? rate ;
//
//   factory Expert.fromJson(Map<String, dynamic> json) => Expert(
//     name: json["name"],
//     email: json["email"],
//     imgpath: json["imgpath"],
//     phonenumber: json["phonenumber"],
//     address: json["address"],
//     experinces: json["experinces"],
//     details: json["details"],
//     starttime: json["starttime"],
//     endtime: json["endtime"],
//     duration: json["duration"],
//     updatedAt: DateTime.parse(json["updated_at"]),
//     createdAt: DateTime.parse(json["created_at"]),
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "email": email,
//     "imgpath": imgpath,
//     "phonenumber": phonenumber,
//     "address": address,
//     "experinces": experinces,
//     "details": details,
//     "starttime": starttime,
//     "endtime": endtime,
//     "duration": duration,
//     "updated_at": updatedAt?.toIso8601String(),
//     "created_at": createdAt?.toIso8601String(),
//     "id": id,
//   };
// }

// To parse this JSON data, do
//
//     final experts = expertsFromJson(jsonString);

import 'dart:convert';

Experts expertsFromJson(String str) => Experts.fromJson(json.decode(str));

String expertsToJson(Experts data) => json.encode(data.toJson());

class Experts {
  Experts({
    required this.experts,
  });

  List<Expert> experts;

  factory Experts.fromJson(Map<String, dynamic> json) => Experts(
    experts: List<Expert>.from(json["experts"].map((x) => Expert.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "experts": List<dynamic>.from(experts.map((x) => x.toJson())),
  };
}

class Expert {
  Expert({
    required this.id,
    required this.name,
    required this.email,
    this.imgpath,
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
  dynamic imgpath;
  var phonenumber;
  var address;
  var valueOfRating;
  int userId;
  var experinces;
  int wallet;
  DateTime createdAt;
  DateTime updatedAt;
  Time time;
  Consultation consultation;

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
    required this.vId,
    this.bId,
    required this.expertId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  dynamic mId=0;
  dynamic pId=0;
  dynamic fId=0;
  dynamic vId=0;
  dynamic bId=0;
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
