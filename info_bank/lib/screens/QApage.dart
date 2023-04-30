import 'package:flutter/material.dart';
import 'package:info_bank/post/answers.dart';
import 'package:info_bank/post/post.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class QApage extends StatefulWidget {
  const QApage({super.key});

  @override
  _QApageState createState() => _QApageState();
}

class _QApageState extends State<QApage> {
  Map<String, dynamic> mObj = {
    'title': '古城麻辣燙排隊人數',
    'note': '古城麻辣燙排隊人數古城麻辣燙',
    'equQAs': ['古城排隊人數', '古城麻辣燙候位人數', '古城還要等多久', '456'],
    'tags': ['美食', '中正大學', '麻辣燙'],
    'equQAsTitle': ['123', '456', '456', '456'],
    'ans': [
      [
        {
          'userName': 'Alan Runner',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '目前需等10號'
        },
        {
          'userName': 'Alan Runner',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '目前需等12號'
        },
        {
          'userName': 'Alan Runner',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '目前需等13號'
        },
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
          'content': 'testingtesting'
        },
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
          'content': 'testingtesting'
        },
      ],
      [
        {
          'userName': 'Alan Runner',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '1111111'
        },
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
          'content': 'testingtesting'
        },
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
          'content': 'testingtesting'
        },
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
          'content': 'testingtesting'
        },
      ],
      [
        {
          'userName': 'Alan Runner',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '222222'
        },
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
          'content': 'testingtesting'
        },
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
          'content': 'testingtesting'
        },
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
          'content': 'testingtesting'
        },
        {
          'userName': 'Alan Runner',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
      ],
      [
        {
          'userName': 'Alan Runner',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '333333'
        },
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
          'content': 'testingtesting'
        },
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
          'content': 'testingtesting'
        },
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
          'content': 'testingtesting'
        },
        {
          'userName': 'Alan Runner',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
      ],
    ]
  };
  List<bool> isUnlocked = [true, false, false, false];
  int AnsNum = 7;
  int selectedSec = 0;

  bool isTextInputVisible = false;
  final textController = TextEditingController();
  final focusNode = FocusNode();
  double keyboardHeight = 0.0;

  void initState() {
    super.initState();
    KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        keyboardHeight =
            visible ? MediaQuery.of(context).viewInsets.bottom : 0.0;
      });
    });
  }

  void switchSec(index) {
    setState(() {
      selectedSec = index;
    });
  }

  void unlock() {
    setState(() {
      isUnlocked[selectedSec] = true;
    });
  }

  void showAns() {
    setState(() {
      isTextInputVisible = !isTextInputVisible;
      if (isTextInputVisible) {
        FocusScope.of(context).requestFocus(focusNode);
      } else {
        FocusScope.of(context).unfocus();
      }
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
              return Row(children: [
                SizedBox(
                    width: 20,
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )),
                // SizedBox(
                //   width: 20,
                //   child: IconButton(
                //     icon: const Icon(
                //       Icons.chevron_left,
                //       color: Colors.black,
                //     ),
                //     onPressed: () => Navigator.of(context).pop(),
                //   ),
                // )
              ]);
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Search()));
                      //Navigator.pushNamed(context, '/search');
                    }),
              ],
            ),
          ],
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  child: ListView(children: [
                    // content
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Container(
                            //top box
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 210, 209, 209),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 8, top: 10),
                                        child: Text(mObj['title'],
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26,
                                                color: Colors.black))),
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(Icons.info, size: 26)),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 12),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: SizedBox(
                                        height: 60,
                                        child: Row(
                                          children: [
                                            Padding(padding: EdgeInsets.all(7)),
                                            Flexible(
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  mObj["note"],
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      height: 40,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          // itemCount: (mObj['tags']).length,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6),
                                              child: OutlinedButton(
                                                  onPressed: () => print(
                                                      'direct'), //! direct to
                                                  child: Text(
                                                    mObj['tags'][
                                                        index], //! access QA name
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        // fontWeight:
                                                        //     FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 5),
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  36,
                                                                  122,
                                                                  39),
                                                          side: BorderSide(
                                                              width: 0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15)),
                                                          ))),
                                            );
                                          }),
                                    ),
                                  ),
                                )
                              ],
                            ))),
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 2),
                      child: SizedBox(
                        // equivalence
                        width: 200,
                        height: 40,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 8, right: 10),
                                child: OutlinedButton(
                                    onPressed: () =>
                                        print('direct'), //! direct to
                                    child: Text(
                                      mObj['equQAs'][index], //! access QA name
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(width: 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ))),
                              );
                            }),
                      ),
                    ),
                    divider0(),
                    ButtonRow(call: switchSec),
                    answerSec(
                      AnsNum: AnsNum,
                      isUnlocked: isUnlocked[selectedSec],
                      secNum: selectedSec,
                      ansObj: mObj['ans'],
                    )
                  ]),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () => print('Button pressed'),
              heroTag: 'btn1',
              child: Icon(Icons.question_answer_outlined),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: FloatingActionButton(
              onPressed: () => unlock(),
              heroTag: 'btn2',
              child: Icon(Icons.lock_open),
            ),
          ),
        ]));
  }
}

class divider0 extends StatelessWidget {
  const divider0({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20,
      thickness: 3,
      indent: 10,
      endIndent: 10,
      color: Colors.black,
    );
  }
}

class answerSec extends StatelessWidget {
  const answerSec(
      {super.key,
      required this.AnsNum,
      required this.secNum,
      required this.isUnlocked,
      required this.ansObj});

  final int AnsNum;
  final int secNum;
  final bool isUnlocked;
  final dynamic ansObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      // height: ,
      child: Column(
        children: [
          ListView.builder(
              padding: EdgeInsets.only(bottom: 50.0),
              shrinkWrap: true,
              itemCount: AnsNum,
              itemBuilder: (context, index) {
                // print(ansObj);
                if (!isUnlocked) {
                  return AnsLocked(
                      index: index, secNum: secNum, lans: ansObj[secNum]);
                } else {
                  return AnsUnlocked(
                      index: index, secNum: secNum, lans: ansObj[secNum]);
                }
              },
              physics: const NeverScrollableScrollPhysics()),
        ],
      ),
    );
  }
}

class ButtonRow extends StatefulWidget {
  @override
  const ButtonRow({super.key, required this.call});
  final Function call;
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  int _selectedIndex = 0;
  void _selectButton(int index) {
    widget.call(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 2),
      child: SizedBox(
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
                onTap: () => _selectButton(index),
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
                                style: TextStyle(
                                  fontSize: 19,
                                  color: _selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
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
      ),
    );
  }
}
