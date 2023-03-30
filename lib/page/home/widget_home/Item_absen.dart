import 'package:absensi/model/precense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class ItemAbsen extends StatelessWidget {
  Absensi? dataItemAbsensi;
  ItemAbsen({required this.dataItemAbsensi, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${dataItemAbsensi?.keperluan}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              dataItemAbsensi?.waktuAbsen.checkIn == null
                  ? '-'
                  : '${DateFormat.yMMMMEEEEd('id-ID').format(dataItemAbsensi!.waktuAbsen.checkIn)} Pukul ${dataItemAbsensi!.waktuAbsen.checkOut == null ? '-' : DateFormat.Hm('id-ID').format(dataItemAbsensi!.waktuAbsen.checkOut!)}',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
          Row(
            children: [
              Image.asset('assets/image/location_icon.png'),
              SizedBox(
                width: 7.5,
              ),
              Expanded(
                child: Text(
                  '${dataItemAbsensi?.lokasiIn}',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Image.asset('assets/image/description_icon.png'),
              SizedBox(
                width: 7.5,
              ),
              Text(
                '${dataItemAbsensi?.rincianKeperluan}',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
