import 'package:flutter/material.dart';
import 'package:info_bank/post/answers.dart';
import 'package:info_bank/post/post.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:google_fonts/google_fonts.dart';

class QApage extends StatefulWidget {
  const QApage({super.key});

  @override
  _QApageState createState() => _QApageState();
}

class _QApageState extends State<QApage> {
  Map<String, dynamic> mObj = {'title': '古城麻辣燙排隊人數'};
  int AnsNum = 7;
  bool isLocked = true;
  void callback() {
    setState(() {
      isLocked = !isLocked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('新貼文'),
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
        body: Column(
          children: [
            Expanded(
              child: ListView(children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(Icons.info, size: 32)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                                width: 200,
                                height: 150,
                                child: Container(
                                    //
                                    ))
                          ],
                        ))),
                GestureDetector(
                  onTap: callback,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                )
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.lock_open, size: 50),
                            ),
                          ))),
                ),
                Divider(
                  height: 20,
                  thickness: 3,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Container(
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
                              return AnsLocked(index: index);
                            } else {
                              return AnsUnlocked(index: index);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
