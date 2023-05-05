import 'package:flutter/material.dart';
import 'package:info_bank/post/list.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/image_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/src/constants/text_strings.dart';
import 'package:info_bank/screens/update_user_screen.dart';

class Profile2 extends StatefulWidget {
  @override
  _ProfileState2 createState() => _ProfileState2();
}

class _ProfileState2 extends State<Profile2>
    with SingleTickerProviderStateMixin {
  List<LList> _currentlists = allList;

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  callback(changedState) {
    setState(() {
      _currentlists = changedState;
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
        title: Text(
          tUserProfile,
          style: GoogleFonts.openSans(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 13),
            child: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Search()));
                  //Navigator.pushNamed(context, '/search');
                }),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(tAvatarImage1)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: tPrimaryColor),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tUserProfileName,
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                tUserProfileHeading,
                style: GoogleFonts.openSans(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const UpdateUserProfileScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text(
                    '自訂個人名片',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.black,
              ),
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
                      "個人評價",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "個人列表",
                      style: TextStyle(color: Colors.black),
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
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return const CardsWidgets();
                        }),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _currentlists.length,
                        itemBuilder: (context, index) {
                          return MyList(currentlist: _currentlists[index]);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardsWidgets extends StatelessWidget {
  const CardsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Average rating of significant answers
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      )),
                  width: 180,
                  height: 120,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 5, right: 5, bottom: 5),
                        child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          child: Text(
                            //title
                            "重要回答\n評價平均分",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 55, bottom: 5),
                              child: Container(
                                width: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          width: 0.3,
                                        ),
                                        color: Colors.blue.withOpacity(0.2)),
                                    child: const Icon(
                                      Icons.functions_outlined,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: 35,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "4.8",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Number of significant answer
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      )),
                  width: 180,
                  height: 120,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 5, right: 5),
                          child: Container(
                            height: 55,
                            child: Text(
                              //title
                              "重要回答總數",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 55, bottom: 5),
                              child: Container(
                                width: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          width: 0.3,
                                        ),
                                        color: Colors.blue.withOpacity(0.2)),
                                    child: const Icon(
                                      Icons.lightbulb_outlined,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: 35,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "60",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Feedback of the best one
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      )),
                  width: 180,
                  height: 120,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 5, right: 5),
                          child: Container(
                            height: 55,
                            child: Text(
                              //title
                              "最佳回答",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 5),
                              child: Container(
                                width: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          width: 0.3,
                                        ),
                                        color: Colors.yellow.withOpacity(0.2)),
                                    child: Icon(
                                      Icons.comment_outlined,
                                      color: Colors.yellow.shade700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: 35,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "4.6",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Container(
                                width: 40,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        width: 0.3,
                                      ),
                                      color: Colors.blue.withOpacity(0.2)),
                                  child: const Icon(
                                    Icons.reviews_outlined,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: 35,
                                child: Text(
                                  "293",
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Total number of good and best
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      )),
                  width: 180,
                  height: 120,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 5, right: 5),
                          child: Container(
                            height: 55,
                            child: Text(
                              //title
                              "最佳和佳的總數",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 5),
                              child: Container(
                                width: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          width: 0.3,
                                        ),
                                        color: Colors.yellow.withOpacity(0.2)),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: 35,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${(3800 / 1000).toStringAsFixed(1)}k",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Container(
                                width: 40,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        width: 0.3,
                                      ),
                                      color: Colors.blue.withOpacity(0.2)),
                                  child: const Icon(
                                    Icons.thumb_up,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: 35,
                                child: Text(
                                  "${(5000 / 1000).toStringAsFixed(1)}k",
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Number of request
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      )),
                  width: 180,
                  height: 120,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 5, right: 5),
                          child: Container(
                            height: 55,
                            child: Text(
                              //title
                              "發佈貼文數",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 55, bottom: 5),
                              child: Container(
                                width: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          width: 0.3,
                                        ),
                                        color: Colors.blue.withOpacity(0.2)),
                                    child: const Icon(
                                      Icons.live_help_outlined,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: 35,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${(3800 / 1000).toStringAsFixed(1)}k",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Lists總追蹤數
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      )),
                  width: 180,
                  height: 120,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 5, right: 5),
                          child: Container(
                            height: 55,
                            child: Text(
                              //title
                              "列表總追蹤數",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 55, bottom: 5),
                              child: Container(
                                width: 40,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          width: 0.3,
                                        ),
                                        color: Colors.blue.withOpacity(0.2)),
                                    child: const Icon(
                                      Icons.playlist_add_outlined,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: 35,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "10",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
