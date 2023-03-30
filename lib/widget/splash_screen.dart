import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffEFF3F8),
        body: Container(
          color: Color(0xffEFF3F8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Absensi Qtera',
                  style: TextStyle(
                      fontSize: 26,
                      color: Color(0xff0170B9),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: 30, width: 30, child: CircularProgressIndicator())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
