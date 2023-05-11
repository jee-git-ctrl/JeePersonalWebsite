import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/post/tag.dart';
import 'package:info_bank/screens/createpost.dart';
import 'package:info_bank/screens/createpost_for_search.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/post/post.dart';
import 'package:info_bank/post/list.dart';
import 'package:info_bank/src/constants/colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  List<Post> _currentposts = allPost;

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

  String query = '';

  void updateQuery(String newQuery) {
    setState(() {
      query = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredPosts = allPost.where((post) {
      return post.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    final filteredTags = allTag.where((tag) {
      return tag.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    final filteredLists = allList.where((list) {
      return list.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            );
          },
        ),
        //backgroundColor: Color(0xffd9d9d9),
        title: TextField(
          onChanged: updateQuery,
          // Call the callback function when the query changes
          decoration: const InputDecoration(
            hintText: 'Search...',
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
              indicatorColor:
                  Colors.black, // Set the color of the tab indicator
              labelStyle: GoogleFonts.openSans(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ), //For Selected tab
              unselectedLabelStyle: GoogleFonts.openSans(
                fontSize: 18,
                color: Colors.grey,
              ), //For Un-selected Tabs

              tabs: const [
                Tab(
                  child: Text(
                    "問答",
                    style: TextStyle(color: tDarkColor),
                  ),
                ),
                Tab(
                  child: Text(
                    "標籤 ",
                    style: TextStyle(color: tDarkColor),
                  ),
                ),
                Tab(
                  child: Text(
                    "列表",
                    style: TextStyle(color: tDarkColor),
                  ),
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
                      itemCount: filteredPosts.length,
                      itemBuilder: (context, index) {
                        if (filteredPosts[index].title == "古城麻辣燙排隊人數") {
                          return Column(
                            children: [
                              MyPost(currentpost: filteredPosts[index]),
                              Container(
                                height: 50,
                                child: ListView.builder(
                                  itemCount: samePost.length + 1,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, sameindex) {
                                    if (sameindex == 0) {
                                      return const SizedBox(
                                        height: 100,
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, left: 10),
                                            child: Icon(
                                              Icons.subdirectory_arrow_right,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    return SamePost(
                                      currentpost: samePost[sameindex - 1],
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          return MyPost(currentpost: filteredPosts[index]);
                        }
                      }),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredTags.length,
                      itemBuilder: (context, index) {
                        return MyTag(currenttag: filteredTags[index]);
                      }),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredLists.length,
                      itemBuilder: (context, index) {
                        return MyList(currentlist: filteredLists[index]);
                      }),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreatePostForSearch()))
                },
                heroTag: 'btn1',
                backgroundColor: tSecondColor,
                child: const Icon(Icons.add_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
