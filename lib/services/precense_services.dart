import 'dart:convert';

import 'package:absensi/page/login/view/login_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/detail_precense_model.dart';
import '../model/precense_model.dart';
import 'package:http/http.dart' as http;

import '../page/home/view/home_view.dart';

class PrecenseServices {
  static Future<dynamic> precenseModel(String filter) async {
    print(filter);
    final box = GetStorage();
    var userData = box.read("userData");
    print('User data in services: $userData');
    var tokens = userData['token'];
    final url = Uri.parse(
        '${dotenv.env['API_BASE_URL']}/mobile/absencies?date=$filter');
    try {
      final response = await http.get(url, headers: {'x-access-token': tokens});
      print('response precense ${response.statusCode}');
      if (response.statusCode == 200) {
        return PrecenseModel.fromJson(jsonDecode(response.body));
      } else {
        box.erase();
        Get.offAll(LoginView());
        Fluttertoast.showToast(msg: 'Silakan Login Kembali');
        // throw Exception();
      }
    } catch (e) {
      print(e);
      box.erase();
      Get.offAll(LoginView());
      Fluttertoast.showToast(msg: 'Silakan Login Kembali$e');
    }
  }

  static Future<dynamic> detaiPrecenseModel(String id) async {
    final box = GetStorage();
    var userData = box.read('userData');
    String tokens = userData['token'];
    final url = Uri.parse('${dotenv.env['API_BASE_URL']}/mobile/absencies/$id');
    final response = await http.get(url, headers: {'x-access-token': tokens});
    if (response.statusCode == 200) {
      return DetailPrecenseModel.fromJson(jsonDecode(response.body));
    } else {
      Get.offAll(HomeView());
      Fluttertoast.showToast(msg: 'Silakan Login Kembali');
    }
  }
}
