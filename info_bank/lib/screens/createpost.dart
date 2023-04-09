import 'dart:math';

import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  List<String> current_tags = [];
  List<String> suggestions = ["recommend", "follow", "ice"];
  final TextEditingController _typeAheadController = TextEditingController();
  String? _selectedCity;
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  @override
  void initState() {
    super.initState();
  }

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
                      child: const Stack(
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
                                            this._typeAheadController.text =
                                                suggestion;
                                            current_tags.add(suggestion);
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
                                  color: Colors.amber,
                                  child: SingleChildScrollView(
                                    child: Wrap(
                                      spacing: 10,
                                      children: <Widget>[
                                        for (var item in current_tags)
                                          Container(
                                            color: Colors.deepOrangeAccent,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    item,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Positioned.fill(
                                                    child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: GestureDetector(
                                                      child: const Icon(
                                                          Icons.remove),
                                                      onTap: () {
                                                        current_tags
                                                            .remove(item);
                                                      }),
                                                ))
                                              ],
                                            ),
                                          ),
                                      ],
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
                            height: 10,
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
                      child: const Stack(
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
  static final List<String> allTags = ['follow', 'recommend', 'ice'];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(allTags);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
