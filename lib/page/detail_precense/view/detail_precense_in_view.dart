import 'package:absensi/page/detail_precense/controller/detail_precense_controller.dart';
import 'package:absensi/page/detail_precense/widget_detail_precense/detail_description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class DetailPrecenseInView extends StatelessWidget {
  const DetailPrecenseInView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetailPrecenseController());
    final GetStorage box = GetStorage();
    dynamic userDataLocal = box.read('userData');
    dynamic userId = userDataLocal['_id'];

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
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    filterQuality: FilterQuality.medium,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        '${dotenv.env['API_BASE_URL']}/files/users/$userId/${controller.detailPrecenseModel!.data.fotoIn}',
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
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
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //         children: [
                              //           Expanded(
                              //             child: Text(
                              //               '${controller.detailPrecenseModel?.data.fotoIn}',
                              //               style:
                              //                   TextStyle(color: Colors.grey),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             width: 10,
                              //           ),
                              //           controller.isLoadingDownload.value ==
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
                              //                           '${controller.countDownload.value}',
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
                              //                       .downloadImg(controller
                              //                           .detailPrecenseModel!
                              //                           .data
                              //                           .fotoIn),
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
                        height: 15,
                      ),
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
                            name: 'Keperluan',
                            description:
                                '${controller.detailPrecenseModel!.data.keperluan}',
                            width: 112,
                          ),
                          DetailDescription(
                            name: 'Tanggal',
                            description:
                                '${DateFormat.yMMMEd('id-ID').format(controller.detailPrecenseModel!.data.waktuAbsen.checkIn)}',
                            width: 124,
                          ),
                          DetailDescription(
                            name: 'Waktu',
                            description:
                                '${DateFormat.Hms('id-ID').format(controller.detailPrecenseModel!.data.waktuAbsen.checkIn)}',
                            width: 135,
                          ),
                          DetailDescription(
                            name: 'Status',
                            description: 'in',
                            width: 136,
                          ),
                          DetailDescription(
                              name: 'Tempat',
                              description:
                                  '${controller.detailPrecenseModel!.data.namaTempat == null ? '-' : controller.detailPrecenseModel!.data.namaTempat}',
                              width: 130),
                          DetailDescription(
                            name: 'Lokasi',
                            description:
                                '${controller.detailPrecenseModel!.data.lokasiIn}',
                            width: 137,
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
