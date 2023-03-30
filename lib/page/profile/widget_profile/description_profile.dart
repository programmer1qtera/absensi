import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DescriptionProfile extends StatelessWidget {
  String title1;
  String desc1;
  String title2;
  String desc2;
  DescriptionProfile(
      {required this.title1,
      required this.desc1,
      required this.title2,
      required this.desc2,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 6,
              ),
              Text(desc1),
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
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 6,
              ),
              Text(desc2),
              SizedBox(
                height: 6,
              ),
              Container(
                height: 2,
                width: double.infinity,
                color: Colors.grey.shade200,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
