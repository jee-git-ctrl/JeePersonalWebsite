import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
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
            color: const Color.fromARGB(255, 194, 194, 194),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 120,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(5.0)),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(3)),
                  const Icon(
                    Icons.person,
                    size: 24,
                    color: Colors.red,
                  ),
                  const Padding(padding: EdgeInsets.all(1)),
                  Text(lans[index]["userName"],
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(lans[index]["reputation"],
                      style: const TextStyle(fontSize: 16.0))
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
                            color: Colors.blueGrey,
                          ),
                          Text(lans[index]['nFeedback'],
                              style: const TextStyle(
                                fontSize: 22,
                              ))
                        ],
                      )),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.lock, size: 40, color: Colors.grey),
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
  AnsUnlocked({required this.index, required this.secNum, required this.lans});

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
            color: Color.fromARGB(255, 194, 194, 194),
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
                        const Icon(
                          Icons.person,
                          size: 24,
                          color: Colors.red,
                        ),
                        const Padding(padding: EdgeInsets.all(1)),
                        Text(widget.lans[widget.index]["userName"],
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(widget.lans[widget.index]["reputation"],
                            style: const TextStyle(fontSize: 16.0))
                      ],
                    ),
                    // Padding(padding: EdgeInsets.all(1.0)),
                    Stack(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 3),
                              child: Text(
                                widget.lans[widget.index]
                                    ["content"], // modified
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )),
                        // SizedBox(
                        //   width: 400, // modify
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Icon(Icons.upcoming),
                        //       Text(
                        //         widget.lans[widget.index]['score'],
                        //         style: TextStyle(
                        //           fontSize: 30,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(5.0))
                  ],
                ),
              ),
              SizedBox(
                width: 100,
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
