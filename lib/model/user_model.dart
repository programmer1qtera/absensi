// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": data.toJson(),
  //     };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.division,
    required this.position,
    // required this.bankAccountName,
    // required this.bankAccountNumber,
    // required this.npwpNumber,
    // required this.npwpFile,
    // required this.bpjsNumber,
    // required this.bpjsCompany,
    // required this.bpjsIndividual,
    // required this.startedAt,
    // this.endedAt,
    required this.ktpNumber,
    // required this.ktpFile,
    // required this.ktpAddress,
    // required this.currentAddress,
    // required this.kkFile,
    required this.photo,
    // required this.gender,
    // required this.birthDate,
    // required this.birthPlace,
    // required this.isMarried,
    // required this.children,
    required this.waNumber,
    // required this.emergencyContactName,
    required this.emergencyContactNumber,
    // required this.basicSalary,
    // required this.dailyWage,
    // required this.overtimePayPerDay,
    // required this.allowances,
    // required this.jkkjkm,
    // required this.remainingDaysOff,
    required this.isActive,
    // required this.user,
    // required this.createdBy,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.v,
    // required this.history,
  });

  String id;
  String name;
  String email;
  String type;
  Division division;
  Division position;
  // String bankAccountName;
  // String bankAccountNumber;
  // String npwpNumber;
  // String npwpFile;
  // String bpjsNumber;
  // int bpjsCompany;
  // int bpjsIndividual;
  // DateTime startedAt;
  // dynamic endedAt;
  String ktpNumber;
  // String ktpFile;
  // String ktpAddress;
  // String currentAddress;
  // String kkFile;
  String photo;
  // String gender;
  // DateTime birthDate;
  // String birthPlace;
  // bool isMarried;
  // int children;
  String waNumber;
  // String emergencyContactName;
  String emergencyContactNumber;
  // int basicSalary;
  // int dailyWage;
  // int overtimePayPerDay;
  // List<Allowance> allowances;
  // int jkkjkm;
  // int remainingDaysOff;
  bool isActive;
  // String user;
  // String createdBy;
  // DateTime createdAt;
  // DateTime updatedAt;
  // int v;
  // List<History> history;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        type: json["type"],
        division: Division.fromJson(json["division"]),
        position: Division.fromJson(json["position"]),
        // bankAccountName: json["bankAccountName"],
        // bankAccountNumber: json["bankAccountNumber"],
        // npwpNumber: json["npwpNumber"],
        // npwpFile: json["npwpFile"],
        // bpjsNumber: json["bpjsNumber"],
        // bpjsCompany: json["bpjsCompany"],
        // bpjsIndividual: json["bpjsIndividual"],
        // startedAt: DateTime.parse(json["startedAt"]),
        // endedAt: json["endedAt"],
        ktpNumber: json["ktpNumber"],
        // ktpFile: json["ktpFile"],
        // ktpAddress: json["ktpAddress"],
        // currentAddress: json["currentAddress"],
        // kkFile: json["kkFile"],
        photo: json["photo"],
        // gender: json["gender"],
        // birthDate: DateTime.parse(json["birthDate"]),
        // birthPlace: json["birthPlace"],
        // isMarried: json["isMarried"],
        // children: json["children"],
        waNumber: json["waNumber"],
        // emergencyContactName: json["emergencyContactName"],
        emergencyContactNumber: json["emergencyContactNumber"],
        // basicSalary: json["basicSalary"],
        // dailyWage: json["dailyWage"],
        // overtimePayPerDay: json["overtimePayPerDay"],
        // allowances: List<Allowance>.from(
        //     json["allowances"].map((x) => Allowance.fromJson(x))),
        // jkkjkm: json["jkkjkm"],
        // remainingDaysOff: json["remainingDaysOff"],
        isActive: json["isActive"],
        // user: json["user"],
        // createdBy: json["createdBy"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
        // history:
        //     List<History>.from(json["history"].map((x) => History.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "name": name,
  //       "email": email,
  //       "type": type,
  //       "division": division.toJson(),
  //       "position": position.toJson(),
  //       "bankAccountName": bankAccountName,
  //       "bankAccountNumber": bankAccountNumber,
  //       "npwpNumber": npwpNumber,
  //       "npwpFile": npwpFile,
  //       "bpjsNumber": bpjsNumber,
  //       "bpjsCompany": bpjsCompany,
  //       "bpjsIndividual": bpjsIndividual,
  //       "startedAt": startedAt.toIso8601String(),
  //       "endedAt": endedAt,
  //       "ktpNumber": ktpNumber,
  //       "ktpFile": ktpFile,
  //       "ktpAddress": ktpAddress,
  //       "currentAddress": currentAddress,
  //       "kkFile": kkFile,
  //       "photo": photo,
  //       "gender": gender,
  //       "birthDate": birthDate.toIso8601String(),
  //       "birthPlace": birthPlace,
  //       "isMarried": isMarried,
  //       "children": children,
  //       "waNumber": waNumber,
  //       "emergencyContactName": emergencyContactName,
  //       "emergencyContactNumber": emergencyContactNumber,
  //       "basicSalary": basicSalary,
  //       "dailyWage": dailyWage,
  //       "overtimePayPerDay": overtimePayPerDay,
  //       "allowances": List<dynamic>.from(allowances.map((x) => x.toJson())),
  //       "jkkjkm": jkkjkm,
  //       "remainingDaysOff": remainingDaysOff,
  //       "isActive": isActive,
  //       "user": user,
  //       "createdBy": createdBy,
  //       "createdAt": createdAt.toIso8601String(),
  //       "updatedAt": updatedAt.toIso8601String(),
  //       "__v": v,
  //       "history": List<dynamic>.from(history.map((x) => x.toJson())),
  //     };
}

// class Allowance {
//   Allowance({
//     required this.name,
//     required this.amount,
//     required this.id,
//   });

//   String name;
//   int amount;
//   String id;

//   factory Allowance.fromJson(Map<String, dynamic> json) => Allowance(
//         name: json["name"],
//         amount: json["amount"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "amount": amount,
//         "_id": id,
//       };
// }

class Division {
  Division({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

// class History {
//   History({
//     required this.id,
//     required this.employee,
//     required this.startedAt,
//     this.endedAt,
//     required this.employeeType,
//     required this.position,
//     this.resignedAt,
//     this.resignNotes,
//     required this.createdBy,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   String id;
//   String employee;
//   DateTime startedAt;
//   dynamic endedAt;
//   String employeeType;
//   String position;
//   dynamic resignedAt;
//   dynamic resignNotes;
//   Division createdBy;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   factory History.fromJson(Map<String, dynamic> json) => History(
//         id: json["_id"],
//         employee: json["employee"],
//         startedAt: DateTime.parse(json["startedAt"]),
//         endedAt: json["endedAt"],
//         employeeType: json["employeeType"],
//         position: json["position"],
//         resignedAt: json["resignedAt"],
//         resignNotes: json["resignNotes"],
//         createdBy: Division.fromJson(json["createdBy"]),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "employee": employee,
//         "startedAt": startedAt.toIso8601String(),
//         "endedAt": endedAt,
//         "employeeType": employeeType,
//         "position": position,
//         "resignedAt": resignedAt,
//         "resignNotes": resignNotes,
//         "createdBy": createdBy.toJson(),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//       };
// }

