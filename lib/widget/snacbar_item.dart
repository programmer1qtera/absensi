import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SnackbarItem extends StatelessWidget {
  IconData icon;
  Color colorIcon;
  bool isClose;
  Color colorText;
  String desc;
  SnackbarItem(
      {required this.icon,
      required this.colorIcon,
      required this.isClose,
      required this.colorText,
      required this.desc,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isClose == false
                  ? SizedBox(
                      width: 1,
                    )
                  : InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    )
            ],
          ),
          Icon(
            icon,
            color: colorIcon,
          ),
          SizedBox(
            height: 23,
          ),
          Text(
            desc,
            style: TextStyle(color: colorText),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
