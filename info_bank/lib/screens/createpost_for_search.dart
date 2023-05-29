import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/screens/QApage2.dart';
import 'package:info_bank/post/post.dart';
import 'package:info_bank/tabs/tabspage.dart';

class CreatePostForSearch extends StatefulWidget {
  final String title;
  CreatePostForSearch({Key? key, required this.title}) : super(key: key);

  @override
  _CreatePostForSearchState createState() => _CreatePostForSearchState();
}

class _CreatePostForSearchState extends State<CreatePostForSearch> {
  late Post newPost;
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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  final TextEditingController _typeAheadController = TextEditingController();
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  final _formKey = GlobalKey<FormState>();
  double dropdownbuttonWidth = 60;
  String _currentprice = "免費";
  var maxLength = 100;
  var textLength = 0;
  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
  }

  callback(changedtag, changedprice, changeddropdownbuttonWidthWidth) {
    setState(() {
      current_tags = changedtag;
      _currentprice = changedprice;
      dropdownbuttonWidth = changeddropdownbuttonWidthWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    List selectedtag = [];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '新貼文',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.chevron_left),
            color: tDarkColor,
          ),
          elevation: 0.0,
          actions: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        newPost = Post(
                            title: _titleController.text,
                            tag: current_tags,
                            Best: 0,
                            unlocked: 0,
                            isfollowed: false);
                        print(addtoList(newPost));
                        // _formKey.currentState!.save();
                        if (context.mounted) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => TabsPage(selectedIndex: 0),
                          ));
                        }
                      }
                    }),
              ],
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: tThirdColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextFormField(
                          controller: _titleController,
                          maxLength: maxLength,
                          obscureText: false,
                          decoration: InputDecoration(
                            focusedErrorBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: '標題：',
                            //contentPadding: EdgeInsets.all(15),
                            suffixText:
                                '${textLength.toString()}/${maxLength.toString()}',
                            counterText: "",
                          ),
                          onChanged: (value) {
                            setState(() {
                              textLength = value.length;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return '請填入標題';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: tThirdColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              hintText: '補充說明（選填）',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: tThirdColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TypeAheadFormField(
                                      textFieldConfiguration:
                                          TextFieldConfiguration(
                                        decoration: const InputDecoration(
                                            hintText: '標籤（選填）',
                                            border: InputBorder.none),
                                        controller: _typeAheadController,
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
                                        _typeAheadController.text = "";
                                        if (!current_tags
                                            .contains(suggestion)) {
                                          current_tags.add(suggestion);
                                        }

                                        callback(current_tags, _currentprice,
                                            dropdownbuttonWidth);
                                        print(suggestion);
                                        print(current_tags);
                                      },
                                      onSaved: (suggestion) {
                                        if (!current_tags.contains(
                                                _typeAheadController.text) &&
                                            suggestion!.isNotEmpty &&
                                            suggestion.length < 20) {
                                          current_tags
                                              .add(_typeAheadController.text);
                                          print("suggestion = " + suggestion);
                                          print(_typeAheadController.text);
                                        }
                                        callback(current_tags, _currentprice,
                                            dropdownbuttonWidth);
                                        _typeAheadController.text = "";
                                      },
                                      suggestionsBoxController:
                                          suggestionBoxController,
                                    ),
                                  ),
                                  TextButton(
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
                                    child: Text(
                                      '加入',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        color: tDarkColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
                                      deleteIcon: const Icon(Icons.close),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 10,
                            thickness: 3,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 40,
                            child: Row(children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors
                                      .white, // Text Color (Foreground color)
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('食物標籤群組'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.add_circle,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Set temptag = Set.from(FoodTagGroup)
                                    ..addAll(current_tags);
                                  current_tags =
                                      new List<String>.from(temptag.toList());
                                  callback(current_tags, _currentprice,
                                      dropdownbuttonWidth);
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors
                                      .white, // Text Color (Foreground color)
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('讀書標籤群組'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.add_circle,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Set temptag = Set.from(StudyTagGroup)
                                    ..addAll(current_tags);
                                  current_tags =
                                      new List<String>.from(temptag.toList());
                                  callback(current_tags, _currentprice,
                                      dropdownbuttonWidth);
                                },
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
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
                        color: tThirdColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                hintText: '回答（選填）',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("解鎖點數"),
                              Price(
                                callback: callback,
                                current_tags: current_tags,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
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

List<String> list = <String>['免費', '\$1', '\$2', '\$5'];

class Price extends StatefulWidget {
  final Function callback;
  final List<String> current_tags;
  const Price({Key? key, required this.callback, required this.current_tags})
      : super(key: key);

  @override
  State<Price> createState() => _Price();
}

class _Price extends State<Price> {
  double dropdownbuttonWidth = 60;
  late List<String> _current_tags;
  String selectedValue = list.first;
  @override
  void initState() {
    _current_tags = widget.current_tags;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: dropdownbuttonWidth,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: list
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            if (selectedValue != value) {
              switch (value) {
                case "免費":
                  dropdownbuttonWidth = 60;
                  widget.callback(
                      _current_tags, selectedValue, dropdownbuttonWidth);
                  break;
                case "\$1":
                  dropdownbuttonWidth = 50;
                  widget.callback(
                      _current_tags, selectedValue, dropdownbuttonWidth);
                  break;
                case "\$2":
                  dropdownbuttonWidth = 50;
                  widget.callback(
                      _current_tags, selectedValue, dropdownbuttonWidth);
                  break;
                case "\$5":
                  dropdownbuttonWidth = 50;
                  widget.callback(
                      _current_tags, selectedValue, dropdownbuttonWidth);
                  break;
              }
            }
            selectedValue = value as String;
          },
          buttonStyleData: ButtonStyleData(
            height: 30,
            width: 50,
            padding: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: tFifthColor,
            ),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.black,
          ),
          dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 50,
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: tFifthColor,
              ),
              elevation: 8,
              offset: const Offset(0, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              )),
          menuItemStyleData: const MenuItemStyleData(
            height: 30,
            padding: EdgeInsets.only(left: 8, right: 8),
          ),
        ),
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text, this.isLongText, {Key? key}) : super(key: key);

  final String text;
  bool isExpanded = false;
  final bool isLongText;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  void initState() {
    if (widget.isLongText) {
      setState(() {
        widget.isExpanded = false;
      });
    } else {
      widget.isExpanded = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedSize(
          //vsync: this,
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
            constraints: widget.isExpanded
                ? const BoxConstraints(maxHeight: 250.0)
                : const BoxConstraints(
                    maxHeight: 60.0,
                  ),
            child: SingleChildScrollView(
              child: Text(
                widget.text,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        widget.isExpanded
            ? ConstrainedBox(constraints: const BoxConstraints())
            : TextButton(
                style: const ButtonStyle(alignment: Alignment.topRight),
                child: const Text('Expand..'),
                onPressed: () => setState(() => widget.isExpanded = true),
              ),
      ],
    );
  }
}
