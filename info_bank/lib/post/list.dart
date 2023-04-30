import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LList {
  final String title;
  final String creator;
  final int followers;
  final String updatetime;
  const LList({
    required this.title,
    required this.creator,
    required this.followers,
    required this.updatetime,
  });
}

const allList = [
  LList(title: '中正大學', creator: '吳', followers: 1200, updatetime: '1天前'),
  LList(title: 'List 1', creator: '林', followers: 1100, updatetime: '過去1個小時'),
  LList(title: 'List 2', creator: '蘇', followers: 89, updatetime: '10:30 A.M.'),
  LList(title: 'List 3', creator: '余', followers: 89, updatetime: '2個月前'),
  LList(title: 'List 4', creator: 'Mr', followers: 89, updatetime: '2天前'),
  LList(title: 'List 5', creator: 'Mr', followers: 89, updatetime: '1天前'),
  LList(title: 'List 6', creator: 'Mr', followers: 89, updatetime: '1週前'),
  LList(title: 'List 7', creator: 'Mrs', followers: 89, updatetime: '1天前'),
  LList(title: 'List 8', creator: 'Mrs', followers: 89, updatetime: '5天前'),
];

class MyList extends StatefulWidget {
  final LList currentlist;

  MyList({required this.currentlist});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
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
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 75,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 8),
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      //title
                      widget.currentlist.title,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.currentlist.creator,
                        style: GoogleFonts.openSans(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "·",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        child: Text(
                          "追蹤人數：${(widget.currentlist.followers / 1000).toStringAsFixed(1)}k",
                          style: GoogleFonts.openSans(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "·",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        child: Text(
                          "${widget.currentlist.updatetime}更新",
                          style: GoogleFonts.openSans(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
