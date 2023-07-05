import 'dart:io';

import 'package:absensi/page/pracense/controller/precense_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class PrecenseView extends GetView<PrecenseController> {
  const PrecenseView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PrecenseController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Buat Absen',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        elevation: 1,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Absen In',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Foto Bukti',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    blurRadius: 2, color: Colors.grey.shade400)
                              ]),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 67,
                                  width: 67,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(controller.filePick!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tambah Foto',
                                        ),
                                        Text(
                                          '${controller.nameFile}',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lokasi',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    blurRadius: 2, color: Colors.grey.shade400)
                              ]),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 67,
                                  width: 67,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF7F7FC),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                      'assets/image/precence-location-icon.png'),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    controller.placeC.text == ''
                                        ? '-'
                                        : controller.placeC.text,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keperluan',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // ExpansionTile(
                        //   title: Text(
                        //     'Pilih',
                        //     style: TextStyle(
                        //         color: Colors.grey,
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w400),
                        //   ),
                        //   children: [
                        //     ListTile(
                        //       title: Text(
                        //         'Meeting',
                        //         style: TextStyle(fontSize: 12),
                        //       ),
                        //     ),
                        //     ListTile(
                        //       title: Text(
                        //         'Lainnya',
                        //         style: TextStyle(fontSize: 12),
                        //       ),
                        //     )
                        //   ],
                        // ),

                        GetBuilder<PrecenseController>(builder: (ctx) {
                          return DropdownButton<String>(
                            isExpanded: true,
                            // value: ctx.dropDownVal,
                            hint: Text(
                                '${ctx.dropDownVal == '' ? 'Pilih' : ctx.dropDownVal}'),
                            items: controller.listDrop
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text('$e'),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              ctx.dropDownfun(value!);
                            },
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rincian Keperluan',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          maxLines: 3,
                          controller: controller.descriptonC,
                          decoration: InputDecoration(
                              hintText: 'Isi Keterangan',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 7,
                                child: CircleAvatar(
                                  radius: 4,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('In')
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 22),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      side: BorderSide(color: Colors.grey)),
                                  shadowColor: Colors.white.withOpacity(0),
                                  primary: Colors.white),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'Batal',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
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
                                  if (controller.isLoading.value == false) {
                                    controller.uploadData(context);
                                  }
                                },
                                child: Text('Konfirmasi')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (controller.isLoading.value == true)
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
