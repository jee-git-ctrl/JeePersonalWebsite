import 'package:flutter/material.dart';
import 'package:info_bank/post/answers.dart';
import 'package:info_bank/post/post.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';

class QApage extends StatefulWidget {
  const QApage({super.key});

  @override
  _QApageState createState() => _QApageState();
}

class _QApageState extends State<QApage> {
  Map<String, dynamic> mObj = {'title': '古城麻辣燙排隊人數'};
  int AnsNum = 7;
  int Sec = 0;
  bool isLocked = false;

  void callback(sec) {
    setState(() {
      Sec = sec;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('問答'),
          leading: Builder(
            builder: (BuildContext context) {
              return SizedBox(
                child: IconButton(
                  icon: const Icon(
                    Icons.list,
                    color: Colors.black,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              );
            },
          ),
          //backgroundColor: Color(0xffd9d9d9),
          elevation: 0.0,
          actions: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Search()));
                      //Navigator.pushNamed(context, '/search');
                    }),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - kToolbarHeight,
                child: ListView(children: [
                  Padding(
                      // info
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(mObj['title'],
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 32,
                                              color: Colors.black))),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(Icons.info, size: 32)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                  // width: 200,
                                  height: 150,
                                  child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.all(10.0)),
                                      Flexible(
                                        child: Text(
                                          'Once upon a time, there was a small village nestled among the hills. The people who lived there were simple folks who led a peaceful life.',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ))),
                  ButtonRow(),
                  const Divider(
                    height: 20,
                    thickness: 3,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.black,
                  ),
                  answerSec(AnsNum: AnsNum, isLocked: isLocked, secNum: Sec)
                ]),
              ),
            ],
          ),
        ));
  }
}

class answerSec extends StatelessWidget {
  const answerSec({
    super.key,
    required this.AnsNum,
    required this.isLocked,
    required this.secNum,
  });

  final int AnsNum;
  final bool isLocked;
  final int secNum;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 700,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: AnsNum,
                itemBuilder: (context, index) {
                  if (isLocked) {
                    return AnsLocked(index: index, secNum: secNum);
                  } else {
                    return AnsUnlocked(index: index, secNum: secNum);
                  }
                },
                physics: const NeverScrollableScrollPhysics()),
          ),
        ],
      ),
    );
  }
}

class ButtonRow extends StatefulWidget {
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  int _selectedIndex = 0;

  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          String txt = 'Free';
          switch (index) {
            case 1:
              txt = '\$1';
              break;
            case 2:
              txt = '\$2';
              break;
            case 3:
              txt = '\$5';
              break;
          }
          _QApageState qaPageState = _QApageState();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: GestureDetector(
              onTap: () => qaPageState.callback(index),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4.2,
                height: 50,
                child: Container(
                  // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? Color.fromARGB(255, 104, 104, 104)
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          txt,
                          style: TextStyle(
                            fontSize: 20,
                            color: _selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(3)),
                            Icon(Icons.speed, color: Colors.blue),
                            Text(
                              '94',
                              style: TextStyle(fontSize: 19),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
