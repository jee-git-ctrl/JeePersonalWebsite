import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/screens/QApage.dart';
import 'package:info_bank/screens/search.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../tabs/tabspage.dart';

class EarningPage extends StatefulWidget {
  const EarningPage({super.key});

  @override
  State<EarningPage> createState() => _EarningPageState();
}

class _EarningPageState extends State<EarningPage> {
  List<String> current_tags = [];
  List<String> current_targets = [];
  List<String> current_equQAs = [];
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
  final TextEditingController _typeAheadController = TextEditingController();
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  final _formKey = GlobalKey<FormState>();
  double dropdownbuttonWidth = 60;
  var maxLength = 100;
  var textLength = 0;

  Map<String, dynamic> mObj = {
    'title': '古城麻辣燙排隊人數',
    'note': '古城麻辣燙排隊人數古城麻辣燙',
    'tags': ['美食', '麻辣燙'],
    'targets': ['中正大學生', '大吃街覓食'],
    'equQAs': ['古城麻辣燙候位人數', '古城還要等多久'],
  };

  List<Map<String, dynamic>> mObj2 = [
    {
      'title': '古城麻辣燙排隊人數',
      'note': '古城麻辣燙排隊人數古城麻辣燙',
      'tags': ['美食', '麻辣燙'],
      'targets': ['中正大學生', '大吃街覓食'],
      'equQAs': ['古城麻辣燙候位人數', '古城還要等多久'],
    },
    {
      'title': '古城麻辣燙排隊人數1',
      'note': '古城麻辣燙排隊人數古城麻辣燙',
      'tags': ['美食', '麻辣燙'],
      'targets': ['中正大學生', '大吃街覓食'],
      'equQAs': ['古城麻辣燙候位人數', '古城還要等多久'],
    },
    {
      'title': '古城麻辣燙排隊人數2',
      'note': '古城麻辣燙排隊人數古城麻辣燙',
      'tags': ['美食', '麻辣燙'],
      'targets': ['中正大學生', '大吃街覓食'],
      'equQAs': ['古城麻辣燙候位人數', '古城還要等多久'],
    },
  ];
  int index = 0;
  callback(changedtag, changedtarget, changedequQA,
      changeddropdownbuttonWidthWidth, changedindex) {
    setState(() {
      current_tags = changedtag;
      current_targets = changedtarget;
      current_equQAs = changedequQA;
      dropdownbuttonWidth = changeddropdownbuttonWidthWidth;
      index = changedindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TabsPage(selectedIndex: 0)),
          ),
          icon: const Icon(
            Icons.chevron_left,
            color: tDarkColor,
          ),
        ),
        elevation: 0.0,
        title: Text(
          mObj['title'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                color: tDarkColor,
                icon: const Icon(Icons.send),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    //create add here
                  }
                },
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight * 1.8,
            child: ListView(
              children: [
                // content
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 10, left: 10, bottom: 5),
                  child: Container(
                    //top box
                    decoration: BoxDecoration(
                      color: tThirdColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 8, top: 10),
                                child: Text(mObj['title'],
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: tDarkColor))),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.info, size: 26)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              height: 60,
                              child: Row(
                                children: [
                                  const Padding(padding: EdgeInsets.all(7)),
                                  Flexible(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        mObj['note'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 40,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: (mObj['tags']).length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 6),
                                    child: OutlinedButton(
                                      onPressed: () =>
                                          print('direct'), //! direct to
                                      child: Text(
                                        mObj['tags'][index], //! access QA name
                                        style: TextStyle(
                                            fontSize: 15,
                                            // fontWeight:
                                            //     FontWeight.bold,
                                            color: tWhiteColor),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        backgroundColor:
                                            Color.fromARGB(255, 36, 122, 39),
                                        side: const BorderSide(width: 0),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: tThirdColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TypeAheadFormField(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      decoration: const InputDecoration(
                                          hintText: '標籤',
                                          border: InputBorder.none),
                                      controller: this._typeAheadController,
                                    ),
                                    suggestionsCallback: (pattern) {
                                      return TagsQuery.getSuggestions(pattern);
                                    },
                                    itemBuilder: (context, String suggestion) {
                                      return ListTile(
                                        title: Text(suggestion),
                                      );
                                    },
                                    transitionBuilder:
                                        (context, suggestionsBox, controller) {
                                      return suggestionsBox;
                                    },
                                    onSuggestionSelected: (String suggestion) {
                                      this._typeAheadController.text = "";
                                      if (!current_tags.contains(suggestion)) {
                                        current_tags.add(suggestion);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          index);
                                      print(suggestion);
                                      print(current_tags);
                                    },
                                    onSaved: (suggestion) {
                                      if (!(mObj['tags']).contains(
                                              _typeAheadController.text) &&
                                          suggestion!.isNotEmpty &&
                                          suggestion.length < 20) {
                                        (mObj['tags'])
                                            .add(_typeAheadController.text);
                                        print("suggestion = " + suggestion);
                                        print(_typeAheadController.text);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          index);
                                      this._typeAheadController.text = "";
                                    },
                                    suggestionsBoxController:
                                        suggestionBoxController,
                                    hideKeyboardOnDrag: true,
                                    hideSuggestionsOnKeyboardHide: false,
                                  ),
                                ),
                                TextButton(
                                  child: Text(
                                    '加入',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: tDarkColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    _formKey.currentState!.save();
                                  },
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            tFifthColor),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            tFifthColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: IntrinsicHeight(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 150,
                                maxHeight: 150,
                              ),
                              child: SingleChildScrollView(
                                child: Wrap(
                                  spacing: 5,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: List<Widget>.generate(
                                      current_tags.length, (int index) {
                                    return Chip(
                                      label: Text(
                                        current_tags[index],
                                        style: GoogleFonts.openSans(),
                                      ),
                                      onDeleted: () {
                                        setState(
                                          () {
                                            current_tags.removeAt(index);
                                          },
                                        );
                                      },
                                      deleteIcon: const Icon(Icons.close),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 40,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: (mObj['tags']).length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: OutlinedButton(
                                      onPressed: () =>
                                          print('direct'), //! direct to
                                      child: Text(
                                        mObj['tags'][index], //! access QA name
                                        style: TextStyle(
                                            fontSize: 15,
                                            // fontWeight:
                                            //     FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        backgroundColor:
                                            Color.fromARGB(255, 36, 122, 39),
                                        side: const BorderSide(width: 0),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: tThirdColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TypeAheadFormField(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      decoration: const InputDecoration(
                                          hintText: '使用者屬性',
                                          border: InputBorder.none),
                                      controller: this._typeAheadController,
                                    ),
                                    suggestionsCallback: (pattern) {
                                      return TargetsQuery.getSuggestions(
                                          pattern);
                                    },
                                    itemBuilder: (context, String suggestion) {
                                      return ListTile(
                                        title: Text(suggestion),
                                      );
                                    },
                                    transitionBuilder:
                                        (context, suggestionsBox, controller) {
                                      return suggestionsBox;
                                    },
                                    onSuggestionSelected: (String suggestion) {
                                      this._typeAheadController.text = "";
                                      if (!current_targets
                                          .contains(suggestion)) {
                                        current_targets.add(suggestion);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          index);
                                      print(suggestion);
                                      print(current_targets);
                                    },
                                    onSaved: (suggestion) {
                                      if (!current_targets.contains(
                                              _typeAheadController.text) &&
                                          suggestion!.isNotEmpty &&
                                          suggestion.length < 20) {
                                        current_targets
                                            .add(_typeAheadController.text);
                                        print("suggestion = " + suggestion);
                                        print(_typeAheadController.text);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          index);
                                      this._typeAheadController.text = "";
                                    },
                                    suggestionsBoxController:
                                        suggestionBoxController,
                                    hideKeyboardOnDrag: true,
                                    hideSuggestionsOnKeyboardHide: false,
                                  ),
                                ),
                                TextButton(
                                  child: Text(
                                    '加入',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: tDarkColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    _formKey.currentState!.save();
                                  },
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            tFifthColor),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            tFifthColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: IntrinsicHeight(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 150,
                                maxHeight: 150,
                              ),
                              child: SingleChildScrollView(
                                child: Wrap(
                                  spacing: 5,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: List<Widget>.generate(
                                      current_targets.length, (int index) {
                                    return Chip(
                                      label: Text(
                                        current_targets[index],
                                        style: GoogleFonts.openSans(),
                                      ),
                                      onDeleted: () {
                                        setState(
                                          () {
                                            current_targets.removeAt(index);
                                          },
                                        );
                                      },
                                      deleteIcon: const Icon(Icons.close),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 40,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: (mObj['targets']).length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: OutlinedButton(
                                      onPressed: () =>
                                          print('direct'), //! direct to
                                      child: Text(
                                        mObj['targets']
                                            [index], //! access QA name
                                        style: TextStyle(
                                            fontSize: 15,
                                            // fontWeight:
                                            //     FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        backgroundColor: tPrimaryColor,
                                        side: const BorderSide(width: 0),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: tThirdColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TypeAheadFormField(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      decoration: const InputDecoration(
                                          hintText: '等價連結',
                                          border: InputBorder.none),
                                      controller: this._typeAheadController,
                                    ),
                                    suggestionsCallback: (pattern) {
                                      return EquQAsQuery.getSuggestions(
                                          pattern);
                                    },
                                    itemBuilder: (context, String suggestion) {
                                      return ListTile(
                                        title: Text(suggestion),
                                      );
                                    },
                                    transitionBuilder:
                                        (context, suggestionsBox, controller) {
                                      return suggestionsBox;
                                    },
                                    onSuggestionSelected: (String suggestion) {
                                      this._typeAheadController.text = "";
                                      if (!current_equQAs
                                          .contains(suggestion)) {
                                        current_equQAs.add(suggestion);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          index);
                                      print(suggestion);
                                      print(current_equQAs);
                                    },
                                    onSaved: (suggestion) {
                                      if (!current_equQAs.contains(
                                              _typeAheadController.text) &&
                                          suggestion!.isNotEmpty &&
                                          suggestion.length < 20) {
                                        current_equQAs
                                            .add(_typeAheadController.text);
                                        print("suggestion = " + suggestion);
                                        print(_typeAheadController.text);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          index);
                                      this._typeAheadController.text = "";
                                    },
                                    suggestionsBoxController:
                                        suggestionBoxController,
                                    hideKeyboardOnDrag: true,
                                    hideSuggestionsOnKeyboardHide: false,
                                  ),
                                ),
                                TextButton(
                                  child: Text(
                                    '加入',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: tDarkColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    _formKey.currentState!.save();
                                  },
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            tFifthColor),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            tFifthColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              // equivalence
                              width: 380,
                              height: 40,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: (mObj['equQAs']).length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: OutlinedButton(
                                      onPressed: () =>
                                          print('direct'), //! direct to
                                      child: Text(
                                        mObj['equQAs']
                                            [index], //! access QA name
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(width: 1),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (index > 0) {
                            setState(() {
                              index -= 1;
                            });
                          }
                        },
                        heroTag: 'btn1',
                        child: const Icon(Icons.navigate_before_outlined),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (index < mObj2.length - 1) {
                            setState(() {
                              index += 1;
                            });
                          }
                        },
                        heroTag: 'btn2',
                        child: const Icon(Icons.navigate_next_outlined),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

class TargetsQuery {
  static final List<String> allTargets = [
    "中正大學生",
    "新生小大一",
    "大二",
    "大三",
    "大四",
    "玩家",
    "搖滾音樂愛好者",
    "日本動畫愛好者"
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(allTargets);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class EquQAsQuery {
  static final List<String> allequQAs = [
    "abc",
    "def",
    "ghi",
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(allequQAs);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
