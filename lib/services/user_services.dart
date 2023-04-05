import 'dart:convert';
import 'package:absensi/model/user_model.dart';
import 'package:absensi/page/login/view/login_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<dynamic> userServices() async {
    final box = GetStorage();
    var userData = box.read('userData');
    String employeeId = userData['employee'];
    String tokens = userData['token'];
    print('toke profile :$tokens ,employeeId : $employeeId');
    final url =
        Uri.parse('${dotenv.env['API_BASE_URL']}/employees/$employeeId');
    try {
      final response = await http.get(url, headers: {'x-access-token': tokens});
      if (response.statusCode == 200) {
        print(response.statusCode);
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        box.erase();
        Get.offAll(LoginView());
        // throw Exception();
      }
    } catch (e) {
      box.erase();
      Get.offAll(LoginView());
    }
  }
}
