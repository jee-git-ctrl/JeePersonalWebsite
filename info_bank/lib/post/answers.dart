import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/screens/QApage.dart';
import 'package:info_bank/src/constants/image_strings.dart';
import 'package:info_bank/src/constants/colors.dart';

class AnsLocked extends StatelessWidget {
  final int index;
  final int secNum;
  final dynamic lans;
  AnsLocked({
    required this.index,
    required this.secNum,
    required this.lans,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return GestureDetector(
        // onTap: () {
        //   Navigator.of(context).push(
        //      MaterialPageRoute(builder: (context) => QApage()));
        // },
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: tThirdColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 120,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(5.0)),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(3)),
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage(
                        tAvatarlist[int.parse(lans[index]["userID"])]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      "·",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(lans[index]["userName"],
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      "·",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(lans[index]["reputation"],
                        style: const TextStyle(fontSize: 16.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      "·",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      child: Text(
                        "1 天前更新",
                        style: GoogleFonts.openSans(),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(5.0)),
              Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        lans[index]["score"],
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.numbers,
                            color: tDarkColor,
                          ),
                          Text(lans[index]['nFeedback'],
                              style: const TextStyle(
                                fontSize: 22,
                              ))
                        ],
                      )),
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.lock,
                        size: 40, color: tSecondColor.withOpacity(0.5)),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.all(5.0))
            ],
          )),
    ));
  }
}

class AnsUnlocked extends StatefulWidget {
  final int index;
  final int secNum;
  final dynamic lans;
  AnsUnlocked({
    required this.index,
    required this.secNum,
    required this.lans,
  });

  @override
  State<AnsUnlocked> createState() => _AnsUnlockedState();
}

class _AnsUnlockedState extends State<AnsUnlocked> {
  int feedback = 0;
  List<Color> fColors = [Colors.grey, Colors.grey, Colors.grey];
  void setFeedback(index) {
    setState(() {
      if (feedback == index) {
        fColors[feedback - 1] = Colors.grey;
        feedback = 0;
        return;
      }
      fColors = [Colors.grey, Colors.grey, Colors.grey];
      feedback = index;
      switch (feedback) {
        case 1:
          fColors[0] = Colors.yellow;
          break;
        case 2:
          fColors[1] = Colors.blue;
          break;
        case 3:
          fColors[2] = Colors.red;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return GestureDetector(
      // onTap: () {
      //   Navigator.of(context).push(
      //      MaterialPageRoute(builder: (context) => QApage()));
      // },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: tThirdColor,
            borderRadius: BorderRadius.circular(8),
          ),
          // width: 50,
          child: Row(
            children: [
              Flexible(
                child: Column(
                  children: [
                    // Padding(padding: EdgeInsets.only(right: 10.0)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.all(3)),
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(tAvatarlist[
                              int.parse(widget.lans[widget.index]["userID"])]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            "·",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(widget.lans[widget.index]["userName"],
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            "·",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(widget.lans[widget.index]["reputation"],
                              style: const TextStyle(fontSize: 16.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            "·",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Container(
                            child: Text(
                              "1 天前更新",
                              style: GoogleFonts.openSans(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 30.0,
                      ),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0, top: 3),
                            child: Text(
                              widget.lans[widget.index]["content"], // modified
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 90,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 85,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   color: Colors.grey[300],
                      // ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: IconButton(
                              icon: Icon(Icons.star, color: fColors[0]),
                              iconSize: 50,
                              onPressed: () {
                                setFeedback(1);
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: IconButton(
                              icon: Icon(Icons.thumb_up, color: fColors[1]),
                              iconSize: 32,
                              onPressed: () {
                                setFeedback(2);
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              icon: Icon(Icons.thumb_down, color: fColors[2]),
                              iconSize: 32,
                              onPressed: () {
                                setFeedback(3);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
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
