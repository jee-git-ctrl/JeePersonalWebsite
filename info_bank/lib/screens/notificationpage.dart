import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/text_strings.dart';
import 'package:info_bank/src/utils/theme/widget_themes/text_theme.dart';
import 'package:info_bank/post/post.dart';
import 'package:info_bank/post/answers.dart';
import 'package:info_bank/post/notification.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  Map<String, dynamic> mObj = {
    'notification': [
      [
        {'title': '古城麻辣燙排隊人數', 'subtitle': '有新的問題等著你幫助回答！'},
        {'title': 'Post 2', 'subtitle': 'content'},
        {'title': 'Post 3', 'subtitle': 'content'},
        {'title': 'Post 4', 'subtitle': 'content'},
        {'title': 'Post 5', 'subtitle': 'content'},
        {'title': 'Post 6', 'subtitle': 'content'},
        {'title': 'Post 7', 'subtitle': 'content'},
        {'title': 'Post 8', 'subtitle': 'content'},
        {'title': 'Post 9', 'subtitle': 'content'},
        {'title': 'Post 10', 'subtitle': 'content'},
      ],
      [
        {'title': '古城麻辣燙排隊人數', 'subtitle': '你問的問題有了新的回答，快來看看吧！'},
        {'title': 'Post 2', 'subtitle': 'content'},
        {'title': 'Post 3', 'subtitle': 'content'},
        {'title': 'Post 4', 'subtitle': 'content'},
        {'title': 'Post 5', 'subtitle': 'content'},
        {'title': 'Post 6', 'subtitle': 'content'},
        {'title': 'Post 7', 'subtitle': 'content'},
        {'title': 'Post 8', 'subtitle': 'content'},
        {'title': 'Post 9', 'subtitle': 'content'},
        {'title': 'Post 10', 'subtitle': 'content'},
      ],
      [
        {'title': '系統通知', 'subtitle': '你收到了來自系統的通知'},
        {'title': 'Post 2', 'subtitle': 'content'},
        {'title': 'Post 3', 'subtitle': 'content'},
        {'title': 'Post 4', 'subtitle': 'content'},
        {'title': 'Post 5', 'subtitle': 'content'},
        {'title': 'Post 6', 'subtitle': 'content'},
        {'title': 'Post 7', 'subtitle': 'content'},
        {'title': 'Post 8', 'subtitle': 'content'},
        {'title': 'Post 9', 'subtitle': 'content'},
        {'title': 'Post 10', 'subtitle': 'content'},
      ],
    ],
  };
  List<bool> buttonChange = [true, false, false];
  int NotificationNum = 7;
  int selectedSec = 0;

  void switchSec(index) {
    setState(() {
      selectedSec = index;
    });
  }

  void change2QA() {
    setState(() {
      buttonChange[selectedSec] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
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
        title: const Text('通知'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(8 * baseWidth),
                          ),
                        ),
                      ),
                      ButtonRow(call: switchSec),
                      notificationSec(
                          NotificationNum: NotificationNum,
                          secNum: selectedSec,
                          buttonChange: buttonChange[selectedSec],
                          notObj: mObj['notification']),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class notificationSec extends StatelessWidget {
  const notificationSec(
      {super.key,
      required this.NotificationNum,
      required this.secNum,
      required this.buttonChange,
      required this.notObj});

  final int NotificationNum;
  final int secNum;
  final bool buttonChange;
  final dynamic notObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: Column(
        children: [
          ListView.builder(
              padding: EdgeInsets.only(bottom: 50.0),
              shrinkWrap: true,
              itemCount: NotificationNum,
              itemBuilder: (context, index) {
                // print(notObj);
                if (buttonChange) {
                  return NotificationQA(
                      index: index, secNum: secNum, lans: notObj[secNum]);
                } else if (!buttonChange) {
                  return NotificationAnswer(
                      index: index, secNum: secNum, lans: notObj[secNum]);
                } else {
                  return NotificationSystem(
                      index: index, secNum: secNum, lans: notObj[secNum]);
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
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index) {
            String txt = '貼文';
            switch (index) {
              case 1:
                txt = '答案';
                break;
              case 2:
                txt = '系統';
                break;
            }
            _NotificationState notificationState = _NotificationState();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5.0),
              child: GestureDetector(
                onTap: () => _selectButton(index),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: 50,
                  child: Container(
                    // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                    decoration: BoxDecoration(
                      color: _selectedIndex == index
                          ? tSecondColor
                          : tPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          txt,
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            color: _selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
