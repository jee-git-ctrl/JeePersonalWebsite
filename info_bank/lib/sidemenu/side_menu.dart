import 'package:flutter/material.dart';
import 'package:myapp/tabs/tabspage.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
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
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: CustomPaint(
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
                                child: const Row(children: [
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
                      builder: (context) => TabsPage(selectedIndex: 2)),
                ),
              },
            ),
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
