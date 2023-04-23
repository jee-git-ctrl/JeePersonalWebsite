import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/text_strings.dart';
import 'package:info_bank/src/utils/theme/widget_themes/text_theme.dart';
import 'package:info_bank/post/post.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  int NotificationNum = 7;
  int Sec = 0;

  void callback(sec) {
    setState(() {
      Sec = sec;
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            height: 18,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(8 * baseWidth),
            ),
          ),
          ButtonRow(),
          const SizedBox(
            height: 10,
          ),
          notificationSec(NotificationNum: NotificationNum, secNum: Sec)
        ],
      ),
    );
  }
}

class notificationSec extends StatelessWidget {
  const notificationSec({
    super.key,
    required this.NotificationNum,
    required this.secNum,
  });

  final int NotificationNum;
  final int secNum;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 600,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: NotificationNum,
              itemBuilder: (context, index) {
                return null;
              },
            ),
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
        children: List.generate(3, (index) {
          String txt = 'QA';
          switch (index) {
            case 1:
              txt = 'Answer';
              break;
            case 2:
              txt = 'System';
              break;
          }
          _NotificationPage notificationPageState = _NotificationPage();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: GestureDetector(
              onTap: () => notificationPageState.callback(index),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4.2,
                height: 50,
                child: Container(
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
