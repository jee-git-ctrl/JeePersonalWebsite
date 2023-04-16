import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:info_bank/post/post.dart';
import 'package:info_bank/screens/search.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double FilterWidth = 88;
  List<Post> _currentposts = allPost;
  callback(changedPost, varFilterWidth) {
    setState(() {
      _currentposts = changedPost;
      FilterWidth = varFilterWidth;
    });
  }
  
  int cnt = 0;
  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double baseHeight = MediaQuery.of(context).size.height;
    String dropdownValue = '未篩選';

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
              HomeFilter(callback: callback),
              Expanded(
                child: Center(
                  child: Text(
                    'InfoBank',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.courgette(),
                  ),
                ),
              ),
              SizedBox(
                width: FilterWidth,
              )
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
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
        drawer: SideMenu(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _currentposts.length,
                  itemBuilder: (context, index) {
                    return MyPost(index: index);
                  }),
            ),
          ],
        ));
  }
}

List<String> list = <String>['未篩選', '追蹤頻道'];

class HomeFilter extends StatefulWidget {
  final Function callback;
  const HomeFilter({super.key, required this.callback});

  @override
  State<HomeFilter> createState() => _HomeFilter();
}

class _HomeFilter extends State<HomeFilter> {
  double FilterWidth = 88; // width 88 100

  String selectedValue = list.first;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: FilterWidth,
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
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            if (selectedValue != value) {
              switch (value) {
                case "未篩選":
                  FilterWidth = 88;
                  widget.callback(filterResults(0), FilterWidth);
                  break;
                case "追蹤頻道":
                  FilterWidth = 100;
                  widget.callback(filterResults(1), FilterWidth);
                  break;
              }
            }
            selectedValue = value as String;
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 180,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Color(0xff272727),
            ),
            elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.yellow,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Color(0xff272727),
              ),
              elevation: 8,
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              )),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }

  List<Post> filterResults(int val) {
    int i = 0;
    String filtertag = '';
    if (val == 1) {
      filtertag = 'follow';
    }
    print("filterResults");
    return allPost.where((_currentpost) {
      final Posttag = _currentpost.tag;
      return Posttag.contains(filtertag); //? change to match?
    }).toList();
  }
}
