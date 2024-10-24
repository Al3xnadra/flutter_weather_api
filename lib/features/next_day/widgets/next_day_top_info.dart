import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayTopInfo extends StatelessWidget {
  const DayTopInfo(
      {super.key,
      required this.date,
      required this.maxtempC,
      required this.mintempC});

  final DateTime date;
  final String maxtempC, mintempC;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Text(
            DateFormat('EEEE dd.MM.yyyy').format(date),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 30),
        child: Text(
          '$maxtempC°C',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 90,
            height: 1,
            color: Colors.white,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 150),
        child: Text(
          '/ $mintempC°C',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 50,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}
