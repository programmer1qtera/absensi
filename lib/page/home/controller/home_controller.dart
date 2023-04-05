import 'package:absensi/model/precense_model.dart';
import 'package:absensi/page/login/view/login_view.dart';
import 'package:absensi/services/precense_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit

    await getPrecense('today');
    super.onInit();
  }

  RxBool isLoading = false.obs;
  PrecenseModel? precenseModel;
  var userName;

  Future<dynamic> getPrecense(String filter) async {
    isLoading(true);
    final box = GetStorage();
    var userDataLocal = box.read('userData');
    print('data local : $userDataLocal');

    var _dataPrecense = await PrecenseServices.precenseModel(filter);

    if (_dataPrecense != null) {
      precenseModel = _dataPrecense;
      // print(precenseModel!.data.absensi[0].hariAbsen);
      isLoading(false);
      userName = userDataLocal['name'];
    } else {
      isLoading(false);
      print('data precense nuul');
    }
  }

  void inOutLogic() async {
    // int dataNum = precenseModel!.data.absensi.length;
    // for (var i in precenseModel!.data.absensi) {
    //   if (1.) {

    //   }
    // }
    var getCekinNow = precenseModel!.data.absensi.last.waktuAbsen.checkIn;
    print(DateFormat.yMEd().format(getCekinNow));
    if (DateFormat.yMEd().format(getCekinNow) ==
        DateFormat.yMEd().format(DateTime.now())) {
      var getCekOut = precenseModel?.data.absensi.last.waktuAbsen.checkOut;
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
