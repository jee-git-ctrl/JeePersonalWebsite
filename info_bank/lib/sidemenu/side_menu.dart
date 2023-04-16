import 'package:flutter/material.dart';
import 'package:info_bank/tabs/tabspage.dart';
import 'package:info_bank/src/services/google_services.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  static final Services _googleServices = Services();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                              image: AssetImage('assets/images/drwoose.png')),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 70,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xFF5FA9C0)),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 21,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 0)),
                )
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 1)),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Profile'),
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 4)),
                ),
              },
            ),
            ElevatedButton(
                onPressed: () {
                  _googleServices.signOut(context);
                },
                child: const Text('Sign out'))
          ],
        ),
      ),
    );
  }
}

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