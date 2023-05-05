import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../src/constants/colors.dart';

class Tag {
  final String name;
  final int QAnumber;
  const Tag({
    required this.name,
    required this.QAnumber,
  });
}

const allTag = [
  Tag(name: '美食', QAnumber: 100),
  Tag(name: '中正大學', QAnumber: 10000),
  Tag(name: '新生須知', QAnumber: 1000),
  Tag(name: '旅行', QAnumber: 100000),
  Tag(name: '時尚', QAnumber: 1000),
  Tag(name: '游戲', QAnumber: 100),
  Tag(name: '考試', QAnumber: 100000),
  Tag(name: '學習', QAnumber: 1000),
  Tag(name: '麻辣燙', QAnumber: 10000),
  Tag(name: '火鍋', QAnumber: 1000),
];

class MyTag extends StatefulWidget {
  final Tag currenttag;

  MyTag({required this.currenttag});

  @override
  State<MyTag> createState() => _MyTagState();
}

class _MyTagState extends State<MyTag> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: tThirdColor,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 50,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 30,
                  child: Text(
                    //name
                    widget.currenttag.name,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 7),
                child: Text(
                  "${widget.currenttag.QAnumber} post",
                  style: GoogleFonts.openSans(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
