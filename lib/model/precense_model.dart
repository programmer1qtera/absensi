// To parse this JSON data, do
//
//     final precenseModel = precenseModelFromJson(jsonString);

import 'dart:convert';

PrecenseModel precenseModelFromJson(String str) =>
    PrecenseModel.fromJson(json.decode(str));

String precenseModelToJson(PrecenseModel data) => json.encode(data.toJson());

class PrecenseModel {
  PrecenseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data data;

  factory PrecenseModel.fromJson(Map<String, dynamic> json) => PrecenseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.absensi,
    required this.total,
  });

  List<Absensi> absensi;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        absensi:
            List<Absensi>.from(json["absensi"].map((x) => Absensi.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "absensi": List<dynamic>.from(absensi.map((x) => x.toJson())),
        "total": total,
      };
}

class Absensi {
  Absensi({
    required this.waktuAbsen,
    required this.id,
    required this.hariAbsen,
    required this.tanggalAbsen,
    required this.employee,
    this.status,
    required this.isTidakMasuk,
    required this.isTelat,
    required this.isLembur,
    required this.isUnpaid,
    required this.lokasiIn,
    required this.lokasiOut,
    required this.fotoIn,
    required this.fotoOut,
    required this.keperluan,
    required this.rincianKeperluan,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  WaktuAbsen waktuAbsen;
  String id;
  String hariAbsen;
  DateTime tanggalAbsen;
  Employee employee;
  dynamic status;
  bool isTidakMasuk;
  bool isTelat;
  bool isLembur;
  bool isUnpaid;
  String lokasiIn;
  String? lokasiOut;
  String fotoIn;
  String? fotoOut;
  String keperluan;
  String rincianKeperluan;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Absensi.fromJson(Map<String, dynamic> json) => Absensi(
        waktuAbsen: WaktuAbsen.fromJson(json["waktu_absen"]),
        id: json["_id"],
        hariAbsen: json["hari_absen"],
        tanggalAbsen: DateTime.parse(json["tanggal_absen"]),
        employee: Employee.fromJson(json["employee"]),
        status: json["status"],
        isTidakMasuk: json["is_tidak_masuk"],
        isTelat: json["is_telat"],
        isLembur: json["is_lembur"],
        isUnpaid: json["is_unpaid"],
        lokasiIn: json["lokasi_in"],
        lokasiOut: json["lokasi_out"],
        fotoIn: json["foto_in"],
        fotoOut: json["foto_out"] == null ? null : json["foto_out"],
        keperluan: json["keperluan"],
        rincianKeperluan: json["rincian_keperluan"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "waktu_absen": waktuAbsen.toJson(),
        "_id": id,
        "hari_absen": hariAbsen,
        "tanggal_absen": tanggalAbsen.toIso8601String(),
        "employee": employee.toJson(),
        "status": status,
        "is_tidak_masuk": isTidakMasuk,
        "is_telat": isTelat,
        "is_lembur": isLembur,
        "is_unpaid": isUnpaid,
        "lokasi_in": lokasiIn,
        "lokasi_out": lokasiOut,
        "foto_in": fotoIn,
        "foto_out": fotoOut,
        "keperluan": keperluan,
        "rincian_keperluan": rincianKeperluan,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Employee {
  Employee({
    required this.id,
    required this.name,
    required this.type,
    required this.position,
  });

  String id;
  String name;
  String type;
  String position;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
        "position": position,
      };
}

class WaktuAbsen {
  WaktuAbsen({
    required this.checkIn,
    this.checkOut,
  });

  DateTime checkIn;
  DateTime? checkOut;

  factory WaktuAbsen.fromJson(Map<String, dynamic> json) => WaktuAbsen(
        checkIn: DateTime.parse(json["check_in"]).toLocal(),
        checkOut: json["check_out"] == null
            ? null
            : DateTime.parse(json["check_out"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "check_in": checkIn.toIso8601String(),
        "check_out": checkOut?.toIso8601String(),
      };
}
