import 'dart:convert';

import 'package:absensi/model/precense_model.dart';
import 'package:absensi/page/login/view/login_view.dart';
import 'package:absensi/services/precense_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../model/user_model.dart';
import '../../../services/user_services.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit

    await getPrecense('today');
    print(now);
    super.onInit();
  }

  RxBool isLoading = false.obs;
  PrecenseModel? precenseModel;
  DateTime now = DateTime.now();

  Future<dynamic> getPrecense(String filter) async {
    isLoading(true);
    final box = GetStorage();
    var userDataLocal = box.read('userData');
    print('data local : $userDataLocal');
    try {
      dynamic _dataPrecense = await PrecenseServices.precenseModel(filter);

      if (_dataPrecense != null) {
        precenseModel = _dataPrecense;

        isLoading(false);
      } else {
        isLoading(false);
        print('data precense nuul');
      }
    } catch (e) {
      Get.offAll(LoginView());
    }
  }

  void inOutLogic() async {
    var getCekinNow = precenseModel!.data.absensi.last.waktuAbsen.checkIn;
    print(DateFormat.yMEd().format(getCekinNow));
    if (DateFormat.yMEd().format(getCekinNow) ==
        DateFormat.yMEd().format(DateTime.now())) {
      DateTime? getCekOut =
          precenseModel?.data.absensi.last.waktuAbsen.checkOut;
      if (getCekOut == null) {
        print('cekout kosong');
      } else {
        print('Sudah Absen Komplit Hari ini');
      }
    } else {
      print('Belum Absen Sama Sekali');
    }
  }
}
