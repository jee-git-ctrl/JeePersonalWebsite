import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/post/post.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';

  void updateQuery(String newQuery) {
    setState(() {
      query = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredPosts = allPost.where((post) {
      return post.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            );
          },
        ),
        //backgroundColor: Color(0xffd9d9d9),
        title: TextField(
          onChanged:
              updateQuery, // Call the callback function when the query changes
          decoration: const InputDecoration(
            hintText: 'Search...',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return MyPost(currentpost: filteredPosts[index]);
        },
      ),
    );
  }
}
