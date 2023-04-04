import 'dart:convert';

import 'package:absensi/page/main_page/main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  var isObscure = false.obs;
  var isLoading = false.obs;

  void obscureFun() {
    isObscure.value = !isObscure.value;
  }

  void login() async {
    isLoading(true);
    try {
      if (usernameC.text != '' || passwordC.text != '') {
        final url =
            Uri.parse('${dotenv.env['API_BASE_URL']}/auth/mobile/sign-in');
        final response = await http.post(url,
            headers: {"Content-Type": 'application/json'},
            body: jsonEncode({
              "username": usernameC.text,
              "password": passwordC.text,
            }));
        if (response.statusCode == 200) {
          print(response.body);
          var data = jsonDecode(response.body);
          var userData = data['data'];
          final box = GetStorage();

          await box.write('userData', userData);
          var dataLocal = box.read('userData');
          print(dataLocal['name']);
          Get.offAll(MainPage());
          isLoading(false);
        } else {
          print(response.statusCode);
          print(response.body);
          Fluttertoast.showToast(
              msg: 'User Name Atau Password Salah',
              gravity: ToastGravity.CENTER);
          isLoading(false);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Isi Samua Data', gravity: ToastGravity.CENTER);
        isLoading(false);
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: 'Cek Koneksi', gravity: ToastGravity.CENTER);
      // Get.back();
      isLoading(false);
      throw Exception();
    }
  }
}
