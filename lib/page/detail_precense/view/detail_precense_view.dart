import 'package:absensi/page/detail_precense/view/detail_precense_in_view.dart';
import 'package:absensi/page/detail_precense/view/detail_precense_out_view.dart';
import 'package:absensi/page/pracense/controller/precense_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DetailPrecenseView extends StatelessWidget {
  DetailPrecenseView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PrecenseController());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Detail Absen',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: false,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 55),
              child: TabBarView(
                children: [
                  DetailPrecenseInView(),
                  DetailPrecenseOutView(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: <Tab>[
                  Tab(
                    text: 'In',
                  ),
                  Tab(
                    text: 'Out',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
