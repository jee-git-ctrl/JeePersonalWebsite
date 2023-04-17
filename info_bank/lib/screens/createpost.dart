import 'dart:math';

import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  List<String> current_tags = [];
  List<String> suggestions = [
    "recommend",
    "follow",
    "food",
    "travel",
    "fasion",
    "game",
    "study",
    "exam",
    "merch",
    "hotpot",
    "CCU",
    "high quality",
    "difficult"
  ];
  List<String> FoodTagGroup = ["food", "hotpot", "high quality"];
  List<String> StudyTagGroup = ["study", "exam", "difficult"];
  final TextEditingController _typeAheadController = TextEditingController();
  String? _selectedCity;
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  HtmlEditorController HtmlEditorcontroller = HtmlEditorController();
  HtmlEditorController HtmlEditorcontroller2 = HtmlEditorController();

  callback(changedtag) {
    setState(() {
      current_tags = changedtag;
    });
  }

  @override
  Widget build(BuildContext context) {
    List selectedtag = [];
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
                        //autofocus: true,
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
                      child: HtmlEditor(
                        /*
                        callbacks: Callbacks(onInit: () {
                          HtmlEditorcontroller.setFullScreen();
                        }),
                        */
                        controller: HtmlEditorcontroller, //required

                        htmlToolbarOptions:
                            HtmlToolbarOptions(defaultToolbarButtons: const [
                          FontButtons(
                            underline: false,
                            clearAll: false,
                            strikethrough: false,
                            superscript: false,
                            subscript: false,
                          ),
                          InsertButtons(
                            audio: false,
                            otherFile: false,
                            table: false,
                            hr: false,
                          )
                        ]),
                        htmlEditorOptions: HtmlEditorOptions(
                          hint: "Your text here...",
                        ),
                        otherOptions: OtherOptions(
                          height: 400,
                        ),
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
                      height: 150,
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TypeAheadFormField(
                                          textFieldConfiguration:
                                              TextFieldConfiguration(
                                            decoration: InputDecoration(
                                                hintText: '標籤：',
                                                border: InputBorder.none),
                                            controller:
                                                this._typeAheadController,
                                          ),
                                          suggestionsCallback: (pattern) {
                                            return TagsQuery.getSuggestions(
                                                pattern);
                                          },
                                          itemBuilder:
                                              (context, String suggestion) {
                                            return ListTile(
                                              title: Text(suggestion),
                                            );
                                          },
                                          transitionBuilder: (context,
                                              suggestionsBox, controller) {
                                            return suggestionsBox;
                                          },
                                          onSuggestionSelected:
                                              (String suggestion) {
                                            this._typeAheadController.text = "";
                                            current_tags.add(suggestion);
                                            callback(current_tags);
                                            print(suggestion);
                                            print(current_tags);
                                          },
                                          suggestionsBoxController:
                                              suggestionBoxController,
                                          validator: (value) => value!.isEmpty
                                              ? '請至少選取一個標籤'
                                              : null,
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                                const VerticalDivider(
                                  width: 5,
                                  thickness: 3,
                                ),
                                Container(
                                  width: 250,
                                  child: SingleChildScrollView(
                                    child: Wrap(
                                      spacing: 10,
                                      children: List<Widget>.generate(
                                          current_tags.length, (int index) {
                                        return Chip(
                                          label: Text(
                                            current_tags[index],
                                            style: GoogleFonts.openSans(),
                                          ),
                                          onDeleted: () {
                                            setState(() {
                                              current_tags.removeAt(index);
                                            });
                                          },
                                          deleteIcon: Icon(Icons.close),
                                        );
                                      }),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 10,
                            thickness: 3,
                            color: Colors.black,
                          ),
                          Container(
                            height: 40,
                            child: Row(children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors
                                      .white, // Text Color (Foreground color)
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('食物標籤群組'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  current_tags =
                                      new List<String>.from(FoodTagGroup);
                                  callback(current_tags);
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors
                                      .white, // Text Color (Foreground color)
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('讀書標籤群組'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  current_tags =
                                      new List<String>.from(StudyTagGroup);
                                  callback(current_tags);
                                },
                              )
                            ]),
                          )
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
                          HtmlEditor(
                            /*callbacks: Callbacks(onInit: () {
                              HtmlEditorcontroller2.setFullScreen();
                            }),*/
                            controller: HtmlEditorcontroller, //required

                            htmlToolbarOptions: HtmlToolbarOptions(
                                defaultToolbarButtons: const [
                                  FontButtons(
                                    underline: false,
                                    clearAll: false,
                                    strikethrough: false,
                                    superscript: false,
                                    subscript: false,
                                  ),
                                  InsertButtons(
                                    audio: false,
                                    otherFile: false,
                                    table: false,
                                    hr: false,
                                  )
                                ]),
                            htmlEditorOptions: HtmlEditorOptions(
                              hint: "Your text here...",
                            ),
                            otherOptions: OtherOptions(
                              height: 400,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(child: Text("解鎖點數")),
                                  Container(
                                    width: 50,
                                    child: Stack(children: [
                                      Container(child: Text("免費")),
                                      Positioned(
                                          right: 0,
                                          child: Icon(Icons.expand_more))
                                    ]),
                                  ),
                                ],
                              ),
                            ),
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

/*
/// This is a fake service that mimics a backend service.
/// It returns a list of suggestions after a 1 second delay.
/// In a real app, this would be a service that makes a network request.
class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    await Future<void>.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {
        'name': query + index.toString(),
        'price': Random().nextInt(100).toString()
      };
    });
  }
}
*/
/// A fake service to filter cities based on a query.
class TagsQuery {
  static final List<String> allTags = [
    "recommend",
    "follow",
    "food",
    "travel",
    "fasion",
    "game",
    "study",
    "exam",
    "merch",
    "hotpot",
    "CCU",
    "high quality",
    "difficult"
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(allTags);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
