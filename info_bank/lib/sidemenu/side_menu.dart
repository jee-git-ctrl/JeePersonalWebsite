import 'package:flutter/material.dart';
import 'package:info_bank/screens/reportpage.dart';
import 'package:info_bank/screens/settingpage.dart';
import 'package:info_bank/src/constants/buttons.dart';
import 'package:info_bank/tabs/tabspage.dart';
import 'package:info_bank/src/services/google_services.dart';
import '../screens/wallet.dart';
import 'package:info_bank/src/constants/allConstants.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  static final Services _googleServices = Services();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Container(
        child: ListView(
          padding: const EdgeInsets.only(left: 5),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                              image: AssetImage('assets/images/drwoose.png')),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('主頁'),
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 0)),
                )
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('搜尋'),
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 1)),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('個人主頁'),
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 4)),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('錢包'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Wallet()),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('設定'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingPage()),
                ),
              },
            ),
            const SizedBox(
              height: 125,
            ),
            SizedBox(
              width: 120,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showReportDialog(context);
                      },
                      child: const Text('Debug Report')),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('登出'),
              onTap: () {
                _googleServices.signOut(context);
              },
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

/*
class DrawerHeaderPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint();

    path.moveTo(0, size.height * 0.87);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.77,
        size.width * 0.52, size.height * 0.84);
    path.quadraticBezierTo(
        size.width * 0.74, size.height * 0.92, size.width, size.height * 0.84);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    paint.color = Colors.black;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
*/
/*
CustomPaint(
                    painter: DrawerHeaderPaint(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 25),
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 30,
                          child: Text("hello"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('data'),
                              Container(
                                color: Colors.red,
                                child: Row(children: [
                                  Icon(Icons.apartment, color: Colors.black),
                                  Expanded(
                                      child: Text(
                                    'data2',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                  )),
                                ]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                */