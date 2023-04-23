import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:info_bank/post/post.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  List<Post> _currentposts = allPost;
  @override
  Widget build(BuildContext context) {
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
          title: Text("探索"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 35.0,
                maxHeight: 150.0,
              ),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return OutlinedButton(
                        onPressed: () => print('direct'), //! direct to
                        child: Text(
                          'tag $index', //! access QA name
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 36, 122, 39),
                            side: BorderSide(width: 0),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )));
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _currentposts.length,
                  itemBuilder: (context, index) {
                    return MyPost(currentpost: _currentposts[index]);
                  }),
            ),
          ],
        ));
  }
}
