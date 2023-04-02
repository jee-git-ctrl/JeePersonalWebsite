import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Post {
  final String title;
  final String tag;
  final double Best;
  final double unlocked;
  const Post({
    required this.title,
    required this.tag,
    required this.Best,
    required this.unlocked,
  });
}

const allPost = [
  Post(title: 'Post 1', tag: 'follow', Best: 89.1, unlocked: 3000),
  Post(title: 'Post 2', tag: 'follow', Best: 71.1, unlocked: 1234),
  Post(title: 'Post 3', tag: 'follow', Best: 67.4, unlocked: 5678),
  Post(title: 'Post 4', tag: 'recommendd', Best: 82.2, unlocked: 9876),
  Post(title: 'Post 5', tag: 'recommendd', Best: 23.3, unlocked: 2351),
];

class MyPost extends StatelessWidget {
  final int index;

  MyPost({required this.index});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 100,
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    //title
                    allPost[index].title,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  )),
              Positioned(
                  //tags
                  bottom: 10,
                  left: 10,
                  child: Text(
                    allPost[index].tag,
                    style: GoogleFonts.openSans(),
                  )),
              Positioned(
                  //bestanswer
                  bottom: 30,
                  right: 10,
                  child: Text(
                    "最佳回答：" + allPost[index].Best.toString() + "%",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Positioned(
                  //answerpotion
                  bottom: 10,
                  right: 10,
                  child: Text(
                    "解鎖次數：" +
                        (allPost[index].unlocked / 1000).toStringAsFixed(1) +
                        "k",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
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