import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/utils/theme/widget_themes/text_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/screens/QApage.dart';
import 'package:info_bank/screens/notificationpage.dart';

class NotificationQA extends StatelessWidget {
  final int index;
  final int secNum;
  final dynamic lans;
  NotificationQA(
      {required this.index, required this.secNum, required this.lans});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QApage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: tThirdColor,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 100,
          child: Stack(
            children: [
              Positioned(
                //title
                top: 10,
                left: 10,
                child: Text(
                  lans[index]['title'],
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Positioned(
                //subtitle content
                bottom: 10,
                left: 10,
                child: Text(
                  lans[index]['subtitle'],
                  style: GoogleFonts.openSans(
                    fontSize: 16,
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

class NotificationAnswer extends StatelessWidget {
  final int index;
  final int secNum;
  final dynamic lans;
  NotificationAnswer(
      {required this.index, required this.secNum, required this.lans});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QApage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: tThirdColor,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 100,
          child: Stack(
            children: [
              Positioned(
                //title
                top: 10,
                left: 10,
                child: Text(
                  lans[index]['title'],
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Positioned(
                //subtitle content
                bottom: 10,
                left: 10,
                child: Text(
                  lans[index]['subtitle'],
                  style: GoogleFonts.openSans(
                    fontSize: 16,
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

class NotificationSystem extends StatelessWidget {
  final int index;
  final int secNum;
  final dynamic lans;
  NotificationSystem(
      {required this.index, required this.secNum, required this.lans});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: tThirdColor,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 100,
          child: Stack(
            children: [
              Positioned(
                //title
                top: 10,
                left: 10,
                child: Text(
                  lans[index]['title'],
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Positioned(
                //subtitle content
                bottom: 10,
                left: 10,
                child: Text(
                  lans[index]['subtitle'],
                  style: GoogleFonts.openSans(
                    fontSize: 16,
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
