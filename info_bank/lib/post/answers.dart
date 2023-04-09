import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/screens/QApage.dart';

List<Map<String, dynamic>> lAns = [
  {
    'userName': 'Alan Runner',
    'reputation': '60%',
    'score': '3.7',
    'nFeedback': '2.6k',
    'content': 'testingtesting'
  },
  {
    'userName': 'Alan Runner',
    'reputation': '60%',
    'score': '3.7',
    'nFeedback': '2.6k',
    'content': '簡單講就是'
  },
  {
    'userName': 'Alan Runner',
    'reputation': '60%',
    'score': '3.7',
    'nFeedback': '2.6k',
    'content': '簡單講就是'
  },
  {
    'userName': 'Alan Runner',
    'reputation': '60%',
    'score': '3.7',
    'nFeedback': '2.6k',
    'content': '簡單講就是'
  },
  {
    'userName': 'Alan Runner',
    'reputation': '60%',
    'score': '3.7',
    'nFeedback': '2.6k',
    'content': '簡單講就是'
  },
  {
    'userName': 'Alan Runner',
    'reputation': '60%',
    'score': '3.7',
    'nFeedback': '2.6k',
    'content': '簡單講就是'
  },
  {
    'userName': 'Alan Runner',
    'reputation': '60%',
    'score': '3.7',
    'nFeedback': '2.6k',
    'content': '簡單講就是'
  },
];

class AnsLocked extends StatelessWidget {
  final int index;

  AnsLocked({required this.index});

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
                  Text(lAns[index]["userName"],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(lAns[index]["reputation"],
                      style: TextStyle(fontSize: 20.0))
                ],
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        lAns[index]["score"],
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Icon(Icons.numbers),
                          Text(lAns[index]['nFeedback'],
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

  AnsUnlocked({required this.index});

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
                  Text(lAns[index]["userName"],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(lAns[index]["reputation"],
                      style: TextStyle(fontSize: 20.0))
                ],
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        lAns[index]["content"],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Icon(Icons.upcoming),
                          Text(lAns[index]['score'],
                              style: TextStyle(
                                fontSize: 30,
                              ))
                        ],
                      )),
                ],
              ),
              Padding(padding: EdgeInsets.all(5.0))
            ],
          )),
    ));
  }
}


// Origin
/* 

Container(
        height: 400,
        color: Colors.deepPurple[200],
        child: Center(
            child: Text(
          child,
          style: TextStyle(fontSize: 40),
        )),
),
*/

//modified
/*
Container(
        padding: EdgeInsets.fromLTRB(4 * fem, 3 * fem, 6 * fem, 4 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                '古城麻辣燙排隊狀況',
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(225 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: 82 * fem,
              height: 16 * fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 82 * fem,
                        height: 16 * fem,
                        child: Text(
                          '最佳回答：72%',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 82 * fem,
                        height: 16 * fem,
                        child: Text(
                          '最佳回答：72%',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(11 * fem, 0 * fem, 0 * fem, 0 * fem),
              height: 20 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 10 * fem, 0 * fem),
                    width: 41 * fem,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12 * fem),
                    ),
                    child: Center(
                      child: Text(
                        '古城',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 159 * fem, 0 * fem),
                    width: 41 * fem,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12 * fem),
                    ),
                    child: Center(
                      child: Text(
                        '排隊',
                      ),
                    ),
                  ),
                  Container(
                    width: 83 * fem,
                    height: 16 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 83 * fem,
                              height: 16 * fem,
                              child: Text(
                                '解鎖次數：2.7k',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 83 * fem,
                              height: 16 * fem,
                              child: Text(
                                '解鎖次數：2.7k',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
*/