import 'dart:convert';

import 'package:absensi/page/home/controller/home_controller.dart';
import 'package:absensi/page/pracense/controller/precense_controller.dart';
import 'package:absensi/page/pracense/controller/precense_out_controller.dart';
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
    controllerHome.getPrecense('today');
    controllerProf.getProfile();
    super.initState();
  }

  int _curentIdx = 0;
  var controllerPrecense = Get.put(PrecenseController());
  var controllerPrecenseOut = Get.put(PrecenseOutController());
  var controllerProf = Get.put(ProfileController());
  var controllerHome = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _curentIdx == 0 ? Color(0xffEFF3F8) : Colors.white,
      body: _curentIdx == 0 ? const HomeView() : ProfileView(),
      bottomNavigationBar: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          elevation: 2,
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
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
