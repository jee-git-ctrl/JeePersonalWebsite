import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/post/post.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/screens/search.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with SingleTickerProviderStateMixin {
  List<Post> _currentposts = allPost;
  List<Post> BountyPost = [
    Post(title: '古城麻辣燙排隊人數', tag: ['Follow'], Best: 89.1, unlocked: 3000),
    Post(title: 'Post 3', tag: ['Follow'], Best: 67.4, unlocked: 5678),
    Post(title: 'Post 4', tag: ['Recommend'], Best: 82.2, unlocked: 9876),
    Post(title: 'Post 6', tag: ['Recommend'], Best: 23.3, unlocked: 2351),
    Post(title: 'Post 7', tag: ['Follow'], Best: 23.3, unlocked: 2351),
    Post(title: 'Post 9', tag: ['Recommend'], Best: 23.3, unlocked: 2351),
    Post(title: 'Post 10', tag: ['Recommend'], Best: 23.3, unlocked: 2351),
  ];
  List<Post> NeedPost = [
    Post(title: '古城麻辣燙排隊人數', tag: ['Follow'], Best: 89.1, unlocked: 3000),
    Post(title: 'Post 2', tag: ['Follow'], Best: 71.1, unlocked: 1234),
    Post(title: 'Post 3', tag: ['Follow'], Best: 67.4, unlocked: 5678),
    Post(title: 'Post 9', tag: ['Recommend'], Best: 23.3, unlocked: 2351),
    Post(title: 'Post 10', tag: ['Recommend'], Best: 23.3, unlocked: 2351),
  ];
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  callback(changedPost) {
    setState(() {
      _currentposts = changedPost;
    });
  }

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
          title: Text("探索",
              style: TextStyle(
                color: Colors.black,
              )),
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
        body: SafeArea(
          minimum: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "熱門標籤",
                        style: GoogleFonts.openSans(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: 35.0,
                  maxHeight: 102.0,
                ),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getCards(),
                  )
                ]),
              ),
              const Divider(
                height: 20,
                thickness: 3,
                indent: 10,
                endIndent: 10,
                color: Colors.black,
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))),
                    child: TextButton(
                        onPressed: () {
                          callback(allPost);
                        },
                        child: Text(
                          "熱門問答",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))),
                    child: TextButton(
                        onPressed: () {
                          callback(BountyPost);
                        },
                        child: Text(
                          "懸賞問答",
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))),
                    child: TextButton(
                      onPressed: () {
                        callback(NeedPost);
                      },
                      child: Text(
                        "需要答案",
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),*/
              TabBar(
                indicatorColor:
                    Colors.black, // Set the color of the tab indicator
                labelStyle: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), //For Selected tab
                unselectedLabelStyle: GoogleFonts.openSans(
                  fontSize: 18,
                ), //For Un-selected Tabs

                tabs: [
                  Tab(
                    child: Text("熱門問答",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  Tab(
                    child: Text("需要答案",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  Tab(
                    child: Text("懸賞問答",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _currentposts.length,
                        itemBuilder: (context, index) {
                          return MyPost(currentpost: _currentposts[index]);
                        }),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: NeedPost.length,
                        itemBuilder: (context, index) {
                          return MyPost(currentpost: NeedPost[index]);
                        }),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: BountyPost.length,
                        itemBuilder: (context, index) {
                          return MyPost(currentpost: BountyPost[index]);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

List<Widget> getCards() {
  final taglist = [
    "tag 1",
    "tag 2",
    "tag 3",
    "tag 4",
    "tag 5",
    "tag 6",
    "tag 7",
    "tag 78",
    "tag 73",
    "tag 21",
    "tag 435",
    "tag 6334",
  ];
  List<Widget> res = [];
  res.add(Row(
      children: taglist.sublist(0, taglist.length ~/ 2 + 1).map((item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 0,
      color: tFifthColor,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          item,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }).toList()));
  res.add(Row(
      children: taglist.sublist(taglist.length ~/ 2 + 1).map((item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 0,
      color: tFifthColor,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          item,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }).toList()));
  return res;
}
