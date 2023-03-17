import 'package:flutter/material.dart';
import 'package:myapp/post/post.dart';
import 'package:myapp/sidemenu/side_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //var post = <SizedBox>[];
  final List _post = [
    'post1',
    'post2',
    'post3',
  ];
  int cnt = 0;
  void addpost() {
    _post.add(
      SizedBox(height: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double baseHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return RotatedBox(
                quarterTurns: 1,
                child: IconButton(
                  icon: const Icon(
                    Icons.bar_chart_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              );
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            IconButton(
                color: Colors.black,
                icon: const Icon(Icons.search),
                onPressed: () {
                  //Navigator.pushNamed(context, '/search');
                }),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(8 * baseWidth),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _post.length,
                  itemBuilder: (context, index) {
                    return MyPost(
                      child: _post[index],
                    );
                  }),
            ),
          ],
        ));
  }
}
