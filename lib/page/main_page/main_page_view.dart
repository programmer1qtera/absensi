import 'dart:convert';

import 'package:absensi/page/home/controller/home_controller.dart';
import 'package:absensi/page/pracense/controller/precense_controller.dart';
import 'package:absensi/page/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../model/user_model.dart';
import '../home/view/home_view.dart';
import '../login/view/login_view.dart';
import '../profile/view/profile_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    // _userServices();
    controllerHome.getPrecense('today');
    controllerProf.getProfile();
    super.initState();
  }

  int _curentIdx = 0;
  var controllerProf = Get.put(ProfileController());
  var controllerHome = Get.put(HomeController());
  // Get.put(PrecenseController());
  // Future<dynamic> _userServices() async {
  //   final box = GetStorage();
  //   var userData = box.read('userData');
  //   var employeeId = userData['employee'];
  //   var tokens = userData['token'];
  //   print('toke profile :$tokens ,employeeId : $employeeId');

  //   try {
  //     final url =
  //         Uri.parse('${dotenv.env['API_BASE_URL']}/employees/$employeeId');
  //     final response =
  //         await http.get(url, headers: {'x-access-token': '$tokens'});
  //     if (response.statusCode == 200) {
  //       print(response.statusCode);
  //       return UserModel.fromJson(jsonDecode(response.body));
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: 'Silakan Login Kembali',
  //       );
  //       box.erase();
  //       Get.offAll(LoginView());
  //       print(response.body);
  //       // box.erase();
  //       // print(box.read('userData'));
  //       // return Get.offAll(LoginView());
  //       // throw Exception('error');
  //     }
  //   } catch (e) {
  //     print('user services error $e');
  //     box.erase();
  //     Get.offAll(LoginView());
  //     Fluttertoast.showToast(
  //         msg: 'Silakan Login Kembali', gravity: ToastGravity.CENTER);
  //     // throw Exception();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // Get.put(ProfileController());
    // Get.put(HomeController());
    // Get.put(PrecenseController());

    return Scaffold(
      backgroundColor: Color(0xffEFF3F8),
      body: _curentIdx == 0 ? const HomeView() : ProfileView(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
            fixedColor: Color(0xff0170B9),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _curentIdx,
            onTap: (value) {
              setState(() {
                _curentIdx = value;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(label: '', icon: Icon(Icons.home_filled)),
              BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
            ]),
      ),
    );
  }
}
