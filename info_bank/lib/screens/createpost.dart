import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:info_bank/src/constants/colors.dart';

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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  final TextEditingController _typeAheadController =
      TextEditingController(); //tags
  SuggestionsBoxController suggestionBoxController =
      SuggestionsBoxController(); //
  final _formKey = GlobalKey<FormState>();
  double dropdownbuttonWidth = 60;
  String _currentprice = "免費";
  var maxLength = 100;
  var textLength = 0;

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
        drawer: SideMenu(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '新貼文',
            style: TextStyle(color: Colors.black),
          ),
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
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        //create add here
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
                          maxLength: maxLength,
                          obscureText: false,
                          controller: _titleController,
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
                            controller: _descriptionController,
                            decoration: InputDecoration(
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
                                        decoration: InputDecoration(
                                            hintText: '標籤（選填）',
                                            border: InputBorder.none),
                                        controller: this._typeAheadController,
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
                                        this._typeAheadController.text = "";
                                      },
                                      suggestionsBoxController:
                                          suggestionBoxController,
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
                                        ))),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: IntrinsicHeight(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 150,
                                  maxHeight: 150,
                                ),
                                child: SingleChildScrollView(
                                  child: Wrap(
                                    spacing: 5,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
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
                              ),
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
                                child: Row(
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
                              controller: _answerController,
                              decoration: InputDecoration(
                                hintText: '回答（選填）',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(child: Text("解鎖點數")),
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
/* Stack position
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Icon(Icons.image),
                            ),
                            Positioned(
                                bottom: 10, left: 35, child: Icon(Icons.link),),
                            Positioned(
                              bottom: 10,
                              left: 60,
                              child: Icon(Icons.format_bold),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 85,
                              child: Icon(Icons.format_italic),
                            ),*/
                  /* Texteditor using Htmleditor 

                        HtmlEditor(
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
                        */

                  /* Original layout for tag
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
                            Container(
                              height: 100,
                              child: Row(
                                children: [
                                  Container(
                                    width: 120,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: TypeAheadFormField(
                                              textFieldConfiguration:
                                                  TextFieldConfiguration(
                                                decoration: InputDecoration(
                                                    hintText: '標籤（選填）',
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
                                                    "";
                                                if (!current_tags
                                                    .contains(suggestion)) {
                                                  current_tags.add(suggestion);
                                                }

                                                callback(
                                                    current_tags,
                                                    _currentprice,
                                                    dropdownbuttonWidth);
                                                print(suggestion);
                                                print(current_tags);
                                              },
                                              suggestionsBoxController:
                                                  suggestionBoxController,
                                            ),
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
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 8.0),
                                        child: SingleChildScrollView(
                                          child: Wrap(
                                            spacing: 10,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            runSpacing: 10,
                                            children: List<Widget>.generate(
                                                current_tags.length,
                                                (int index) {
                                              return Chip(
                                                label: Text(
                                                  current_tags[index],
                                                  style: GoogleFonts.openSans(),
                                                ),
                                                onDeleted: () {
                                                  setState(() {
                                                    current_tags
                                                        .removeAt(index);
                                                  });
                                                },
                                                deleteIcon: Icon(Icons.close),
                                              );
                                            }),
                                          ),
                                        ),
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
                                  child: Row(
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
                                    Set temptag = Set.from(FoodTagGroup)
                                      ..addAll(current_tags);
                                    current_tags =
                                        new List<String>.from(temptag.toList());
                                    callback(current_tags, _currentprice,
                                        dropdownbuttonWidth);
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
                                  child: Row(
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
                  */