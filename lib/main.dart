import 'package:absensi/page/login/view/login_view.dart';
import 'package:absensi/page/main_page/main_page_view.dart';
import 'package:absensi/widget/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await initializeDateFormatting("id-ID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final userHasLog = box.read('userData');
    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 3)),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return GetMaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: userHasLog == null ? LoginView() : MainPage());
          }
        });
  }
}
