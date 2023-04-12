import 'package:absensi/page/login/view/login_view.dart';
import 'package:absensi/page/profile/controller/profile_controller.dart';
import 'package:absensi/page/profile/widget_profile/description_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    final box = GetStorage();
    var userDataLocal = box.read("userData");
    var userId = userDataLocal['_id'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Color(0xff0063F7),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 50,
                        backgroundImage: CachedNetworkImageProvider(
                          '${dotenv.env['API_BASE_URL']}/files/users/$userId/${controller.resul?.data.photo}',
                          errorListener: () => Center(child: Icon(Icons.image)),
                        )),
                    // CircleAvatar(
                    //   backgroundColor: Colors.grey,
                    //   radius: 35,
                    //   child: CachedNetworkImage(
                    //     fit: BoxFit.cover,
                    //     imageUrl:
                    //         '${dotenv.env['API_BASE_URL']}/files/users/$userId/${controller.resul?.data.photo}',
                    //     placeholder: (context, url) =>
                    //         Center(child: CircularProgressIndicator()),
                    //     errorWidget: (context, url, error) {
                    //       return Center(
                    //         child: Icon(Icons.image),
                    //       );
                    //     },
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text('${controller.resul?.data.name}'),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                height: 2,
                                width: double.infinity,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          DescriptionProfile(
                            title1: 'Employee Number',
                            desc1: '${controller.resul?.data.ktpNumber}',
                            title2: 'Email',
                            desc2: '${controller.resul?.data.email}',
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          DescriptionProfile(
                            title1: 'Phone Number',
                            desc1: '${controller.resul?.data.waNumber}',
                            title2: 'Kontak Darurat',
                            desc2:
                                '${controller.resul?.data.emergencyContactNumber}',
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          DescriptionProfile(
                            title1: 'Divisi',
                            desc1: '${controller.resul?.data.division.name}',
                            title2: 'Jabatan',
                            desc2: '${controller.resul?.data.position.name}',
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          DescriptionProfile(
                            title1: 'Status Aktif',
                            desc1: controller.resul?.data.isActive == true
                                ? 'Aktif'
                                : 'Tidak Aktif',
                            title2: 'Status Karyawan',
                            desc2: 'Karyawan ${controller.resul?.data.type}',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(color: Colors.blue)),
                            shadowColor: Colors.white.withOpacity(0),
                            primary: Colors.white),
                        onPressed: () {
                          controller.logOut();
                          // box.erase();
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => LoginView(),
                          // ));
                          // Get.offAll(LoginView());

                          // box.remove('userData');
                          // print(box.read('userData'));
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
