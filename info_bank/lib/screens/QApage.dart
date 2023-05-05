import 'package:flutter/material.dart';
import 'package:info_bank/post/answers.dart';
import 'package:info_bank/post/post.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/screens/reportpage.dart';
import 'package:info_bank/src/constants/image_strings.dart';

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
          'userID': '1',
          'userName': 'Alan Runner',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '目前需等10號'
        },
        {
          'userID': '2',
          'userName': 'Walter Black',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '目前需等12號'
        },
        {
          'userID': '3',
          'userName': 'Emily Brown',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '目前需等13號'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
      ],
      [
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '1111111'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
      ],
      [
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '222222'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
      ],
      [
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': '333333'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
          'reputation': '60%',
          'score': '3.7',
          'nFeedback': '2.6k',
          'content': 'testingtesting'
        },
        {
          'userID': '5',
          'userName': 'Anonymous',
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
  bool toggle = false;

  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showOverlay();
      } else {
        _hideOverlay();
      }
    });
  }

  String curSec() {
    String txt = 'Free';
    switch (selectedSec) {
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
    return txt;
  }

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 0,
        right: 0,
        child: Text('hiefwef'),
        // child: Container(
        //   color: Colors.white,
        //   child: Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: TextField(
        //       autofocus: true,
        //       decoration: InputDecoration(
        //         border: OutlineInputBorder(),
        //         labelText: 'Enter text',
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _hideOverlay();
    super.dispose();
  }

  // bool isTextInputVisible = false;
  // final textController = TextEditingController();
  // final focusNode = FocusNode();
  // double keyboardHeight = 0.0;

  // void initState() {
  //   super.initState();
  //   KeyboardVisibilityController().onChange.listen((bool visible) {
  //     setState(() {
  //       keyboardHeight =
  //           visible ? MediaQuery.of(context).viewInsets.bottom : 0.0;
  //     });
  //   });
  // }

  void switchSec(index) {
    setState(() {
      selectedSec = index;
    });
  }

  unlock() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: tThirdColor,
            content: Container(
              color: tThirdColor,
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("確定要解鎖？"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("現有點數：15pt"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(tSecondColor)),
                          child: Text("確定"),
                          onPressed: () {
                            setState(() {
                              isUnlocked[selectedSec] = true;
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(tSecondColor)),
                          child: Text("取消"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  showAns() {
    if (!isUnlocked[selectedSec]) {
      return;
    }
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: tThirdColor,
            content: Container(
              width: 400,
              child: Form(
                key: _formKey,
                child: Container(
                  color: tThirdColor,
                  // decoration: BoxDecoration(
                  //   color: Color.fromARGB(255, 194, 194, 194),
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.all(3)),
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: AssetImage(tAvatarImage1),
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
                          Text('Alan',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                          Padding(padding: EdgeInsets.all(3)),
                          Text('60%', style: TextStyle(fontSize: 16.0))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: '請輸入回答'),
                        ),
                      ),
                      Stack(
                        children: [
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  color: tFifthColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(curSec(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(tSecondColor)),
                                child: Text("回答"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
  // void showAns() {
  //   setState(() {
  //     isTextInputVisible = !isTextInputVisible;
  //     if (isTextInputVisible) {
  //       FocusScope.of(context).requestFocus(focusNode);
  //     } else {
  //       FocusScope.of(context).unfocus();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.chevron_left,
                color: tDarkColor,
              )),
          //backgroundColor: Color(0xffd9d9d9),
          elevation: 0.0,
          title: Text(mObj['title'],
              style: const TextStyle(color: tDarkColor, fontSize: 20)),
          centerTitle: true,
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 13),
              child: IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Search()));
                    //Navigator.pushNamed(context, '/search');
                  }),
            )
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
                          color: tThirdColor,
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
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showReportDialog(context);
                                          },
                                          icon: Icon(Icons.warning_amber_sharp,
                                              size: 26),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              // Here we changing the icon.
                                              toggle = !toggle;
                                            });
                                          },
                                          icon: toggle
                                              ? const Icon(
                                                  Icons.favorite_border,
                                                  size: 26)
                                              : const Icon(
                                                  Icons.favorite,
                                                  size: 26,
                                                  color: tPrimaryColor,
                                                ),
                                        ),
                                      ],
                                    ),
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
                                  height: 30,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // itemCount: (mObj['tags']).length,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 6),
                                        child: OutlinedButton(
                                          onPressed: () =>
                                              print('direct'), //! direct to
                                          child: Text(
                                            mObj['tags']
                                                [index], //! access QA name
                                            style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight:
                                                //     FontWeight.bold,
                                                color: tDarkColor),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            backgroundColor: tFifthColor,
                                            side: BorderSide.none,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                                padding: EdgeInsets.only(left: 8, right: 5),
                                child: OutlinedButton(
                                    onPressed: () =>
                                        print('direct'), //! direct to
                                    child: Text(
                                      mObj['equQAs'][index], //! access QA name
                                      style: TextStyle(
                                          fontSize: 18, color: tDarkColor),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: tThirdColor,
                                        side: BorderSide.none,
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
          Visibility(
            visible: isUnlocked[selectedSec],
            child: Positioned(
              bottom: 20.0,
              right: 20.0,
              child: FloatingActionButton(
                onPressed: () {
                  showAns();
                },
                heroTag: 'btn1',
                backgroundColor: tSecondColor,
                child: const Icon(Icons.question_answer_outlined),
              ),
            ),
          ),
          Visibility(
            visible: !isUnlocked[selectedSec],
            child: Positioned(
              bottom: 20.0,
              right: 20.0,
              child: FloatingActionButton(
                onPressed: () {
                  unlock();
                },
                heroTag: 'btn2',
                backgroundColor: tSecondColor,
                child: const Icon(Icons.lock_open),
              ),
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
      thickness: 1,
      indent: 10,
      endIndent: 10,
      color: tThirdColor,
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
                    index: index,
                    secNum: secNum,
                    lans: ansObj[secNum],
                  );
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
      padding: const EdgeInsets.only(top: 5, bottom: 2),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
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
                      width: MediaQuery.of(context).size.width / 5,
                      height: 50,
                      child: Container(
                        // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                        decoration: BoxDecoration(
                          color: _selectedIndex == index
                              ? tSecondColor
                              : tThirdColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '(94)',
                                  style: TextStyle(
                                    fontSize: 16,
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
                );
              }),
            ),
            Icon(Icons.filter_list_rounded)
          ],
        ),
      ),
    );
  }
}
