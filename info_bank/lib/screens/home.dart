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
  //var post = <SizedBox>[];
  final List _post = [
    'post1',
    'post2',
    'post3',
    'post4',
    'post5',
  ];

  int cnt = 0;
  void addpost() {
    _post.add(
      SizedBox(height: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double baseHeight = MediaQuery.of(context).size.height;
    String dropdownValue = '全部';
    double FilterWidth = 76; // width 76 100 136
    return Scaffold(
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
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              Stack(
                children: <Widget>[
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: FilterWidth), // max text length
                      child: HomeFilter(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'InfoBank',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.courgette(),
                  ),
                ),
              ),
              /*
              IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/search');
                  }),*/
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          /*
          leading: Builder(
            builder: (BuildContext context) {
              return Row(
                children: [
                  
                ],
              );
            },
          ),*/
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
                  itemCount: _post.length,
                  itemBuilder: (context, index) {
                    return MyPost(
                      child: _post[index],
                    );
                  }),
            ),
          ],
        ));
  }
}

List<String> list = <String>['全部', '追蹤頻道', '個人屬性推薦'];

class HomeFilter extends StatefulWidget {
  const HomeFilter({super.key});

  @override
  State<HomeFilter> createState() => _HomeFilter();
}

class _HomeFilter extends State<HomeFilter> {
  String selectedValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
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
          setState(() {
            selectedValue = value as String;
          });
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
    );
  }
}
