import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        autofocus: true,
                        //controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '標題：',
                        ),
                        //onChanged: () {},
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return '請填入標題';
                          }
                          return null;
                        },
                      ),
                    )),
                const Divider(
                  height: 20,
                  thickness: 3,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //height: 120,
                      child: Stack(
                        children: [
                          SizedBox(
                              height: 120,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '備註：',
                                  border: InputBorder.none,
                                ),
                              )),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Icon(Icons.image),
                          ),
                          Positioned(
                              bottom: 10, left: 35, child: Icon(Icons.movie)),
                          Positioned(
                            bottom: 10,
                            left: 60,
                            child: Icon(Icons.link),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 85,
                            child: Icon(Icons.format_bold),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 110,
                            child: Icon(Icons.format_italic),
                          ),
                        ],
                      ),
                    )),
                const Divider(
                  height: 20,
                  thickness: 3,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //height: 120,
                      child: Stack(
                        children: [
                          SizedBox(
                              height: 120,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '標籤：',
                                  border: InputBorder.none,
                                ),
                              )),
                        ],
                      ),
                    )),
                const Divider(
                  height: 20,
                  thickness: 3,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //height: 120,
                      child: Stack(
                        children: [
                          SizedBox(
                              height: 120,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '新增回答：',
                                  border: InputBorder.none,
                                ),
                              )),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Icon(Icons.image),
                          ),
                          Positioned(
                              bottom: 10, left: 35, child: Icon(Icons.movie)),
                          Positioned(
                            bottom: 10,
                            left: 60,
                            child: Icon(Icons.link),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 85,
                            child: Icon(Icons.format_bold),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 110,
                            child: Icon(Icons.format_italic),
                          ),
                        ],
                      ),
                    )),
              ]),
            ),
          ],
        ));
  }
}
