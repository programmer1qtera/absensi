import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailDescription extends StatelessWidget {
  String name;
  String description;
  double width;
  DetailDescription(
      {required this.name,
      required this.description,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(name),
              SizedBox(
                width: width,
              ),
              Expanded(child: Text(description))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}
