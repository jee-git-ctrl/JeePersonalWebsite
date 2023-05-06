import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:info_bank/screens/reportpage.dart';
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
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  final _formKey = GlobalKey<FormState>();
  double dropdownbuttonWidth = 60;
  var maxLength = 100;
  var textLength = 0;
  bool toggle = false;

  List<Map<String, dynamic>> mObj2 = [
    {
      'title': '古城麻辣燙排隊人數',
      'note': '古城麻辣燙排隊人數古城麻辣燙',
      'posttags': ['美食', '麻辣燙'],
      'tags': ['美食', '麻辣燙'],
      'targets': ['中正大學生', '大吃街覓食'],
      'equQAs': [
        '古城麻辣燙候位人數',
        '古城還要等多久',
      ],
    },
    {
      'title': '古城麻辣燙排隊人數1',
      'note': '古城麻辣燙排隊人數古城麻辣燙',
      'posttags': ['美食', '麻辣燙'],
      'tags': ['美食', '麻辣燙'],
      'targets': ['中正大學生', '大吃街覓食'],
      'equQAs': [
        '古城麻辣燙候位人數',
        '古城還要等多久',
      ],
    },
    {
      'title': '古城麻辣燙排隊人數2',
      'note': '古城麻辣燙排隊人數古城麻辣燙',
      'posttags': ['美食', '麻辣燙'],
      'tags': ['美食', '麻辣燙'],
      'targets': ['中正大學生', '大吃街覓食'],
      'equQAs': [
        '古城麻辣燙候位人數',
        '古城還要等多久',
      ],
    },
  ];
  int pagesindex = 0;

  // var index;
  callback(changedtag, changedtarget, changedequQA,
      changeddropdownbuttonWidthWidth, changedindex) {
    setState(() {
      current_tags = changedtag;
      current_targets = changedtarget;
      current_equQAs = changedequQA;
      dropdownbuttonWidth = changeddropdownbuttonWidthWidth;
      pagesindex = changedindex;
    });
  }

  TextEditingController _typeTagAheadController = TextEditingController();
  TextEditingController _typeTargetAheadController = TextEditingController();
  TextEditingController _typeEquQAAheadController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _typeTagAheadController = TextEditingController();
    _typeTargetAheadController = TextEditingController();
    _typeEquQAAheadController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _typeTagAheadController.dispose();
    _typeTargetAheadController.dispose();
    _typeEquQAAheadController.dispose();
    _focusNode.dispose();
    super.dispose();
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
          mObj2[pagesindex]['title'],
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
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
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
                                child: Text(
                                  mObj2[pagesindex]['title'],
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26,
                                      color: tDarkColor),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showReportDialog(context);
                                        },
                                        icon: const Icon(
                                            Icons.warning_amber_sharp,
                                            size: 26),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              // Here we changing the icon.
                                              toggle = !toggle;
                                            },
                                          );
                                        },
                                        icon: toggle
                                            ? const Icon(
                                                Icons.favorite_border,
                                                size: 26,
                                                color: tPrimaryColor,
                                              )
                                            : const Icon(
                                                Icons.favorite,
                                                size: 26,
                                                color: tPrimaryColor,
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
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
                                          mObj2[pagesindex]['note'],
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
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                height: 30,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      (mObj2[pagesindex]['posttags']).length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: OutlinedButton(
                                        onPressed: () =>
                                            print('direct'), //! direct to

                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          backgroundColor: tFifthColor,
                                          side: BorderSide.none,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          mObj2[pagesindex]['tags']
                                              [index], //! access QA name
                                          style: const TextStyle(
                                              fontSize: 14,
                                              // fontWeight:
                                              //     FontWeight.bold,
                                              color: tDarkColor),
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
                          Padding(
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
                                      controller: _typeTagAheadController,
                                    ),
                                    suggestionsCallback: (pattern) {
                                      return TagsQuery.getSuggestions(pattern);
                                    },
                                    itemBuilder: (
                                      context,
                                      String suggestion,
                                    ) {
                                      return ListTile(
                                        trailing: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            color: tFifthColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                ((suggestion.length) *
                                                            (suggestion.length +
                                                                1) %
                                                            5 +
                                                        1)
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                        title: Text(suggestion),
                                      );
                                    },
                                    transitionBuilder:
                                        (context, suggestionsBox, controller) {
                                      return suggestionsBox;
                                    },
                                    onSuggestionSelected: (String suggestion) {
                                      _typeTagAheadController.text = "";
                                      if (!(mObj2[pagesindex]['tags']).contains(
                                              _typeTagAheadController.text) &&
                                          suggestion.isNotEmpty &&
                                          suggestion.length < 20) {
                                        mObj2[pagesindex]['tags']
                                            .add(suggestion);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          pagesindex);
                                      _focusNode.unfocus();
                                    },
                                    onSaved: (suggestion) {
                                      if (!(mObj2[pagesindex]['tags']).contains(
                                              _typeTagAheadController.text) &&
                                          suggestion!.isNotEmpty &&
                                          suggestion.length < 20) {
                                        mObj2[pagesindex]['tags']
                                            .add(_typeTagAheadController.text);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          pagesindex);
                                      _typeTagAheadController.text = "";
                                    },
                                    suggestionsBoxController:
                                        suggestionBoxController,
                                    hideOnEmpty: true,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    String newTag =
                                        _typeTagAheadController.text;
                                    if (newTag.isNotEmpty &&
                                        newTag.length < 20 &&
                                        !mObj2[pagesindex]['tags']
                                            .contains(newTag)) {
                                      setState(
                                        () {
                                          mObj2[pagesindex]['tags'].add(newTag);
                                        },
                                      );
                                    }
                                    callback(
                                        current_tags,
                                        current_targets,
                                        current_equQAs,
                                        dropdownbuttonWidth,
                                        pagesindex);
                                    _typeTagAheadController.text = "";
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
                                  child: Text(
                                    '加入',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: tDarkColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
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
                                    current_tags.length,
                                    (int index) {
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
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                height: 30,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: (mObj2[pagesindex]['tags']).length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: OutlinedButton(
                                        onPressed: () =>
                                            print('direct'), //! direct to

                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          backgroundColor: tFifthColor,
                                          side: BorderSide.none,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          mObj2[pagesindex]['tags']
                                              [index], //! access QA name
                                          style: const TextStyle(
                                              fontSize: 14,
                                              // fontWeight:
                                              //     FontWeight.bold,
                                              color: tDarkColor),
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
                          Padding(
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
                                      controller: _typeTargetAheadController,
                                    ),
                                    suggestionsCallback: (pattern) {
                                      return TargetsQuery.getSuggestions(
                                          pattern);
                                    },
                                    itemBuilder: (context, String suggestion) {
                                      return ListTile(
                                        trailing: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            color: tFifthColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                ((suggestion.length) *
                                                            (suggestion.length +
                                                                1) %
                                                            5 +
                                                        1)
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                        title: Text(suggestion),
                                      );
                                    },
                                    transitionBuilder:
                                        (context, suggestionsBox, controller) {
                                      return suggestionsBox;
                                    },
                                    onSuggestionSelected: (String suggestion) {
                                      _typeTargetAheadController.text = "";
                                      if (!(mObj2[pagesindex]['targets'])
                                              .contains(_typeTagAheadController
                                                  .text) &&
                                          suggestion.isNotEmpty &&
                                          suggestion.length < 20) {
                                        mObj2[pagesindex]['targets']
                                            .add(suggestion);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          pagesindex);
                                      _focusNode.unfocus();
                                    },
                                    onSaved: (suggestion) {
                                      if (!(mObj2[pagesindex]['targets'])
                                              .contains(
                                                  _typeTargetAheadController
                                                      .text) &&
                                          suggestion!.isNotEmpty &&
                                          suggestion.length < 20) {
                                        mObj2[pagesindex]['targets'].add(
                                            _typeTargetAheadController.text);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          pagesindex);
                                      _typeTargetAheadController.text = "";
                                    },
                                    suggestionsBoxController:
                                        suggestionBoxController,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    String newTarget =
                                        _typeTargetAheadController.text;
                                    if (newTarget.isNotEmpty &&
                                        newTarget.length < 20 &&
                                        !mObj2[pagesindex]['targets']
                                            .contains(newTarget)) {
                                      setState(() {
                                        mObj2[pagesindex]['targets']
                                            .add(newTarget);
                                      });
                                    }
                                    callback(
                                        current_tags,
                                        current_targets,
                                        current_equQAs,
                                        dropdownbuttonWidth,
                                        pagesindex);
                                    _typeTargetAheadController.text = "";
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
                                  child: Text(
                                    '加入',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: tDarkColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                height: 30,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      (mObj2[pagesindex]['targets']).length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: OutlinedButton(
                                        onPressed: () =>
                                            print('direct'), //! direct to
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          backgroundColor: tPrimaryColor,
                                          side: BorderSide.none,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          mObj2[pagesindex]['targets']
                                              [index], //! access QA name
                                          style: const TextStyle(
                                              fontSize: 14, color: tDarkColor),
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
                          Padding(
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
                                      controller: _typeEquQAAheadController,
                                    ),
                                    suggestionsCallback: (pattern) {
                                      return EquQAsQuery.getSuggestions(
                                          pattern);
                                    },
                                    itemBuilder: (context, String suggestion) {
                                      return ListTile(
                                        trailing: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            color: tFifthColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                ((suggestion.length) *
                                                            (suggestion.length +
                                                                1) %
                                                            5 +
                                                        1)
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                        title: Text(suggestion),
                                      );
                                    },
                                    transitionBuilder:
                                        (context, suggestionsBox, controller) {
                                      return suggestionsBox;
                                    },
                                    onSuggestionSelected: (String suggestion) {
                                      _typeEquQAAheadController.text = "";
                                      if (!(mObj2[pagesindex]['equQAs'])
                                              .contains(
                                                  _typeEquQAAheadController
                                                      .text) &&
                                          suggestion.isNotEmpty &&
                                          suggestion.length < 20) {
                                        mObj2[pagesindex]['equQAs']
                                            .add(suggestion);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          pagesindex);
                                      _focusNode.unfocus();
                                    },
                                    onSaved: (suggestion) {
                                      if (!(mObj2[pagesindex]['equQAs'])
                                              .contains(
                                                  _typeEquQAAheadController
                                                      .text) &&
                                          suggestion!.isNotEmpty &&
                                          suggestion.length < 20) {
                                        mObj2[pagesindex]['equQAs'].add(
                                            _typeEquQAAheadController.text);
                                      }
                                      callback(
                                          current_tags,
                                          current_targets,
                                          current_equQAs,
                                          dropdownbuttonWidth,
                                          pagesindex);
                                      _typeEquQAAheadController.text = "";
                                    },
                                    suggestionsBoxController:
                                        suggestionBoxController,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    String newEquQA =
                                        _typeEquQAAheadController.text;
                                    if (newEquQA.isNotEmpty &&
                                        newEquQA.length < 20 &&
                                        !mObj2[pagesindex]['equQAs']
                                            .contains(newEquQA)) {
                                      setState(() {
                                        mObj2[pagesindex]['equQAs']
                                            .add(newEquQA);
                                      });
                                    }
                                    callback(
                                        current_tags,
                                        current_targets,
                                        current_equQAs,
                                        dropdownbuttonWidth,
                                        pagesindex);
                                    _typeEquQAAheadController.text = "";
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
                                  child: Text(
                                    '加入',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: tDarkColor,
                                    ),
                                  ),
                                ),
                              ],
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
                                  itemCount:
                                      (mObj2[pagesindex]['equQAs']).length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: OutlinedButton(
                                        onPressed: () =>
                                            print('direct'), //! direct to

                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(width: 1),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                        ),
                                        child: Text(
                                          mObj2[pagesindex]['equQAs']
                                              [index], //! access QA name
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: tDarkColor,
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
                    children: <Widget>[
                      Visibility(
                        visible: (pagesindex > 0),
                        child: Positioned(
                          bottom: 20,
                          left: 20,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: FloatingActionButton(
                              onPressed: () {
                                if (pagesindex > 0) {
                                  setState(() {
                                    pagesindex -= 1;
                                  });
                                }
                              },
                              heroTag: 'btn1',
                              backgroundColor: tSecondColor,
                              child: const Icon(Icons.navigate_before_outlined),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (pagesindex < mObj2.length - 1),
                        child: Positioned(
                          bottom: 20,
                          right: 20,
                          child: FloatingActionButton(
                            onPressed: () {
                              if (pagesindex < mObj2.length - 1) {
                                setState(() {
                                  pagesindex += 1;
                                });
                              }
                            },
                            heroTag: 'btn2',
                            backgroundColor: tSecondColor,
                            child: const Icon(Icons.navigate_next_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 300,
                  ),
                ],
              ),
            ),
          ],
        ),
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
    "古城麻辣燙候位人數",
    "古城還要等多久",
    "古城麻辣燙前面排了多少人？",
    "古城麻辣燙排隊的人潮如何？",
    "在古城麻辣燙排隊等候的人數很多嗎？",
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(allequQAs);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
