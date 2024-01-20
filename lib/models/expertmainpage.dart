// // To parse this JSON data, do
// //
// //     final experts = expertsFromJson(jsonString);
//
// import 'dart:convert';
//
// Experts expertsFromJson(String str) => Experts.fromJson(json.decode(str));
//
// String expertsToJson(Experts data) => json.encode(data.toJson());
//
// class Experts {
//   Experts({
//  required   this.experts,
//   });
//
//   List<Expert> experts;
//
//   factory Experts.fromJson(Map<String, dynamic> json) => Experts(
//     experts: List<Expert>.from(json["experts"].map((x) => Expert.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "experts":  List<dynamic>.from(experts.map((x) => x.toJson())),
//   };
// }
//
// class Expert {
//   Expert({
//     required   this.id,
//     required  this.name,
//     required    this.email,
//     required   this.imgpath,
//     required   this.phonenumber,
//     required   this.address,
//     required   this.rating,
//     required   this.experinces,
//     required   this.details,
//     required   this.starttime,
//     required   this.endtime,
//     required   this.duration,
//     required   this.wallet,
//     required   this.createdAt,
//     required   this.updatedAt,
//   });
//
//   int id;
//   String name;
//   String email;
//   String imgpath;
//   String phonenumber;
//   String address;
//   int rating;
//   String experinces;
//   String details;
//   String starttime;
//   String endtime;
//   int duration;
//   int wallet;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Expert.fromJson(Map<String, dynamic> json) => Expert(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     imgpath: json["imgpath"],
//     phonenumber: json["phonenumber"],
//     address: json["address"],
//     rating: json["rating"],
//     experinces: json["experinces"],
//     details: json["details"],
//     starttime: json["starttime"],
//     endtime: json["endtime"],
//     duration: json["duration"],
//     wallet: json["wallet"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "imgpath": imgpath,
//     "phonenumber": phonenumber,
//     "address": address,
//     "rating": rating,
//     "experinces": experinces,
//     "details": details,
//     "starttime": starttime,
//     "endtime": endtime,
//     "duration": duration,
//     "wallet": wallet,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }
