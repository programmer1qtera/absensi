import 'dart:io';

import 'package:absensi/page/main_page/main_page_view.dart';
import 'package:absensi/page/pracense/controller/precense_controller.dart';
import 'package:absensi/page/pracense/view/precense_view.dart';
import 'package:absensi/widget/snacbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class ConfirmPictureView extends GetView<PrecenseController> {
  const ConfirmPictureView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PrecenseController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Konfirmasi Foto',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          elevation: 1,
          centerTitle: false,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: GetBuilder<PrecenseController>(builder: (ctx) {
            return Column(
              children: [
                Container(
                  color: Colors.black,
                  height: 300,
                  width: double.infinity,
                  child: Image.file(
                    File(ctx.filePick!.path),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 54),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.image),
                          SizedBox(
                            width: 33,
                          ),
                          Expanded(
                              child: Text(
                            '${controller.nameFile}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(
                            width: 33,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${DateFormat.yMMMEd('id-ID').format(controller.now!)}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                Text(
                                    '${DateFormat.Hm('id-ID').format(controller.now!)}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 33,
                          ),
                          Expanded(
                              child: Text('${controller.address}',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 36),
                  height: 156,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(6))),
                        child: FlutterMap(
                          options: MapOptions(
                            keepAlive: true,
                            center: LatLng(controller.position!.latitude,
                                controller.position!.longitude),
                            zoom: 17,
                          ),
                          nonRotatedChildren: [
                            AttributionWidget.defaultWidget(
                              source: 'OpenStreetMap contributors',
                              onSourceTapped: null,
                            ),
                          ],
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(controller.position!.latitude,
                                      controller.position!.longitude),
                                  builder: (context) => Icon(
                                    Icons.location_on,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(6))),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: controller.placeC,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      hintText: 'Tambahka Keterangan Lokasi',
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 22),
                  child: Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor:
                                    Color(0xff0170B9).withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side: BorderSide(color: Colors.grey)),
                                shadowColor: Colors.white.withOpacity(0),
                                primary: Colors.white),
                            onPressed: () {
                              final box = GetStorage();
                              var userData = box.read("userData");
                              final name = userData['name'];
                              final tokens = userData['token'];
                              controller.pickImage(tokens, name);
                            },
                            child: controller.isLoading.value == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    'Foto Ulang',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                primary: Color(0xff0170B9)),
                            onPressed: () {
                              if (controller.isFakeGps == true) {
                                controller.address = null;
                                controller.nameFile = null;
                                controller.filePick = null;
                                controller.isFakeGps = false;
                                print('change  ${controller.isFakeGps}');
                                controller.now = null;
                                controller.position = null;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    elevation: 10,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.35,
                                        left: 10,
                                        right: 10),
                                    backgroundColor: Color(0xffFFF5F5),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    content: SnackbarItem(
                                        isClose: true,
                                        colorIcon: Colors.red,
                                        colorText: Colors.red,
                                        icon: Icons.info,
                                        desc:
                                            'Dikarenakan melanggar peraturan, maka anda tidak diperkenankan melanjutkan absen. Silahkan nonaktifkan fake gps anda dan absen ulang.'),
                                  ),
                                );

                                Get.offAll(MainPage());
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    // showCloseIcon: true,
                                    duration: Duration(milliseconds: 800),

                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    elevation: 10,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.40,
                                        left: 10,
                                        right: 10),
                                    backgroundColor: Colors.white,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    content: SnackbarItem(
                                        isClose: false,
                                        colorIcon: Colors.green,
                                        colorText: Colors.black,
                                        icon: Icons.check_circle,
                                        desc: 'Foto dan Lokasi Terkonfirmasi'),
                                  ),
                                );

                                Get.to(PrecenseView());
                              }
                            },
                            child: Text('Konfirmasi')),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
