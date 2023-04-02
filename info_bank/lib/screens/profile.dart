import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: IconButton(
                icon: Icon(
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
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
