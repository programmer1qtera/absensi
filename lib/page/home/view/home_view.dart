import 'package:absensi/page/detail_precense/controller/detail_precense_controller.dart';
import 'package:absensi/page/detail_precense/view/detail_precense_view.dart';
import 'package:absensi/page/pracense/controller/precense_controller.dart';
import 'package:absensi/page/pracense/controller/precense_out_controller.dart';
import 'package:absensi/page/profile/controller/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../controller/home_controller.dart';
import '../widget_home/Item_absen.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var controller2 = Get.put(PrecenseController());
    var controller3 = Get.put(PrecenseOutController());
    var controller4 = Get.put(DetailPrecenseController());
    var controller5 = Get.put(ProfileController());

    final box = GetStorage();
    var userDataLocal = box.read('userData');
    var userName = userDataLocal['name'];
    var userId = userDataLocal['_id'];
    return Scaffold(
      // backgroundColor: Color(),
      backgroundColor: Color(0xffEFF3F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leadingWidth: 150,
        leading: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Absen',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Obx(
              () => controller5.isLoading.value == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${userName}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('${controller5.resul?.data.position.name}',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black))
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 30,

                          backgroundImage: CachedNetworkImageProvider(
                            '${dotenv.env['API_BASE_URL']}/files/users/$userId/${controller5.resul?.data.photo}',
                            errorListener: () =>
                                Center(child: Icon(Icons.image)),
                          ),
                          // child: CachedNetworkImage(
                          //   imageUrl:
                          //       '${dotenv.env['API_BASE_URL']}/files/users/$userId/${controller5.resul?.data.photo}',
                          //   placeholder: (context, url) =>
                          //       Center(child: CircularProgressIndicator()),
                          //   errorWidget: (context, url, error) {
                          //     return Center(
                          //       child: Icon(Icons.image),
                          //     );
                          //   },
                          // ),
                        )
                      ],
                    ),
            ),
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.precenseModel?.data.absensi.length == null ||
                    controller.precenseModel?.data.absensi.length == 0
                ? Center(
                    child: Text(
                      'Belum Melakukan Aktifitas Absen',
                      style: TextStyle(color: Color(0xff0170B9)),
                    ),
                  )
                : Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.precenseModel?.data.absensi.length,
                              itemBuilder: (context, index) {
                                var dataItem = controller
                                    .precenseModel?.data.absensi[index];
                                return InkWell(
                                    onTap: () async {
                                      await controller4
                                          .getDetailPrecense(dataItem!.id);
                                    },
                                    child: ItemAbsen(
                                      dataItemAbsensi: dataItem,
                                    ));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                      '${controller.precenseModel?.data.total}'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Total Data'),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    elevation: 15,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    context: context,
                                    builder: (_) => Container(
                                      height: 260,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(
                                          left: 32, top: 8, right: 32),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 5,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.getPrecense('');
                                              Get.back();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Semua',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.getPrecense('today');
                                              Get.back();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Hari ini',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .getPrecense('last1week');
                                              Get.back();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '1 Minggu Terakhir',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .getPrecense('last1month');
                                              Get.back();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '1 Bulan Terakir',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 36,
                                  width: 154,
                                  decoration: BoxDecoration(
                                      color: Color(0xffEFF3F8),
                                      borderRadius: BorderRadius.circular(6),
                                      border:
                                          Border.all(color: Color(0xff0170B9))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Jangka Waktu',
                                        style:
                                            TextStyle(color: Color(0xff0170B9)),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Color(0xff0170B9),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
      floatingActionButton: Obx(
        () => InkWell(
          onTap: () {
            // controller.inOutLogic();
            // controller2.pickImage();
            var dataNull = controller.precenseModel?.data.absensi.length;

            if (dataNull == null || dataNull == 0) {
              controller2.pickImage();
            } else {
              var getCekOut = controller
                  .precenseModel?.data.absensi.last.waktuAbsen.checkOut;
              if (getCekOut == null) {
                controller3.pickImage();
              } else {
                controller2.pickImage();
              }
            }

            print('ontap');

            // if (controller2.isLoading.value == false) {
            //   if (controller
            //           .precenseModel!.data.absensi.first.waktuAbsen.checkOut ==
            //       null) {
            //     controller3.pickImage();
            //   }
            //   controller2.pickImage();
            // } else {
            //   Fluttertoast.showToast(
            //       msg: 'Tunggu Sebentar...', gravity: ToastGravity.CENTER);
            // }
          },
          child: Container(
              width: 121,
              height: 38,
              decoration: BoxDecoration(
                  color: const Color(0xff0170B9),
                  borderRadius: BorderRadius.circular(30)),
              child: Stack(
                children: [
                  controller2.isLoading.value == true
                      ? Center(
                          child: Container(
                            height: 20,
                            width: 20,
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          ),
                        )
                      : Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 0.58,
                              ),
                              Text(
                                'Buat Absen',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                ],
              )),
        ),
      ),
    );
  }
}
