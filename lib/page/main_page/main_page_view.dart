import 'package:absensi/page/pracense/controller/precense_controller.dart';
import 'package:absensi/page/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/view/home_view.dart';
import '../profile/view/profile_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curentIdx = 0;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PrecenseController());

    return Scaffold(
      backgroundColor: Color(0xffEFF3F8),
      body: _curentIdx == 0 ? HomeView() : ProfileView(),
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
