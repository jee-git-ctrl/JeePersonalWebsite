import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'package:info_bank/screens/QApage.dart';

class AnsLocked extends StatelessWidget {
  final int index;
  final int secNum;
  final dynamic lans;
  AnsLocked({required this.index, required this.secNum, required this.lans});

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
            color: Color.fromARGB(255, 194, 194, 194),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 120,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(5.0)),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 30,
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  Text(lans[index]["userName"],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(lans[index]["reputation"],
                      style: TextStyle(fontSize: 20.0))
                ],
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        lans[index]["score"],
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Icon(Icons.numbers),
                          Text(lans[index]['nFeedback'],
                              style: TextStyle(
                                fontSize: 30,
                              ))
                        ],
                      )),
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.lock, size: 40, color: Colors.blueGrey),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(5.0))
            ],
          )),
    ));
  }
}

class AnsUnlocked extends StatelessWidget {
  final int index;
  final int secNum;
  final dynamic lans;
  AnsUnlocked({required this.index, required this.secNum, required this.lans});

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
            color: Color.fromARGB(255, 194, 194, 194),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 120,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(4.0)),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 30,
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  Text(lans[index]["userName"],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(lans[index]["reputation"],
                      style: TextStyle(fontSize: 20.0))
                ],
              ),
              // Padding(padding: EdgeInsets.all(1.0)),
              Stack(
                children: [
                  Container(
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
                            icon: Icon(Icons.star),
                            iconSize: 50,
                            onPressed: () {
                              // Add your star icon button code here
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            icon: Icon(Icons.thumb_up),
                            iconSize: 32,
                            onPressed: () {
                              // Add your like icon button code here
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: Icon(Icons.thumb_down),
                            iconSize: 32,
                            onPressed: () {
                              // Add your dislike icon button code here
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        lans[index]["content"], // modified
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  SizedBox(
                    width: 400, // modify
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.upcoming),
                        Text(
                          lans[index]['score'],
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(5.0))
            ],
          )),
    ));
  }
}
