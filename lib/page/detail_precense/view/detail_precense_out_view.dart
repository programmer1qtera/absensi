import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../controller/detail_precense_controller.dart';
import '../widget_detail_precense/detail_description.dart';

class DetailPrecenseOutView extends StatelessWidget {
  const DetailPrecenseOutView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetailPrecenseController());
    final box = GetStorage();
    var userDataLocal = box.read('userData');
    var userId = userDataLocal['_id'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          DetailDescription(
                            name: 'Nama',
                            description:
                                '${controller.detailPrecenseModel!.data.employee.name}',
                            width: 137,
                          ),
                          DetailDescription(
                            name: 'Role',
                            description:
                                '${controller.detailPrecenseModel!.data.employee.position}',
                            width: 149,
                          ),
                          DetailDescription(
                            name: 'Tanggal',
                            description:
                                '${controller.detailPrecenseModel!.data.waktuAbsen.checkOut == null ? '-' : DateFormat.yMMMEd('id-ID').format(controller.detailPrecenseModel!.data.waktuAbsen.checkOut!)}',
                            width: 124,
                          ),
                          DetailDescription(
                            name: 'Waktu',
                            description:
                                '${controller.detailPrecenseModel!.data.waktuAbsen.checkOut == null ? '-' : DateFormat.Hms('id-ID').format(controller.detailPrecenseModel!.data.waktuAbsen.checkOut!)}',
                            width: 135,
                          ),
                          DetailDescription(
                            name: 'Status',
                            description: 'Out',
                            width: 136,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Rincian Keperluan',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    blurRadius: 2, color: Colors.grey.shade300)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: SingleChildScrollView(
                              child: Text(
                                  '${controller.detailPrecenseModel!.data.rincianKeperluan}'),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Foto Bukti Absen',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  blurRadius: 2, color: Colors.grey.shade300)
                            ]),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width / 1.3,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: controller.detailPrecenseModel!.data
                                            .fotoOut ==
                                        null
                                    ? Container()
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.medium,
                                          imageUrl:
                                              '${dotenv.env['API_BASE_URL']}/files/users/$userId/${controller.detailPrecenseModel!.data.fotoOut}',
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) {
                                            return Center(
                                              child: Icon(Icons.image),
                                            );
                                          },
                                        ),
                                      ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              // Expanded(
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //         border: Border.all(
                              //             color: Colors.grey.shade300),
                              //         borderRadius: BorderRadius.circular(10)),
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(5),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Expanded(
                              //             child: Text(
                              //               '${controller.detailPrecenseModel!.data.fotoOut == null ? '-' : controller.detailPrecenseModel!.data.fotoOut}',
                              //               style:
                              //                   TextStyle(color: Colors.grey),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             width: 10,
                              //           ),
                              //           controller.isLoadingDownloadOut.value ==
                              //                   true
                              //               ? Container(
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Stack(
                              //                     children: [
                              //                       Center(
                              //                           child:
                              //                               CircularProgressIndicator()),
                              //                       Center(
                              //                         child: Text(
                              //                           '${controller.countDownloadOut.value}',
                              //                           style: TextStyle(
                              //                               fontSize: 10,
                              //                               color: Colors.grey),
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 )
                              //               : InkWell(
                              //                   onTap: () => controller
                              //                               .detailPrecenseModel
                              //                               ?.data
                              //                               .fotoOut ==
                              //                           null
                              //                       ? Fluttertoast.showToast(
                              //                           msg: 'File Tidak Ada',
                              //                           gravity:
                              //                               ToastGravity.CENTER)
                              //                       : controller.isLoadingDownloadOut
                              //                                   .value ==
                              //                               true
                              //                           ? Fluttertoast
                              //                               .showToast(
                              //                                   msg:
                              //                                       'Tunggu...',
                              //                                   gravity:
                              //                                       ToastGravity
                              //                                           .CENTER)
                              //                           : controller.downloadImgOut(
                              //                               controller
                              //                                   .detailPrecenseModel!
                              //                                   .data
                              //                                   .fotoOut),
                              //                   child: Icon(
                              //                     Icons.download,
                              //                     color: Colors.grey,
                              //                   ),
                              //                 )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
