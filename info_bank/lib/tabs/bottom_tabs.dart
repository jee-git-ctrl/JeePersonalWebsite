import 'package:flutter/material.dart';
import 'package:info_bank/screens/home.dart';
import 'package:info_bank/screens/notificationpage.dart';
import 'package:info_bank/screens/profile_2.dart';
import 'package:info_bank/screens/discover.dart';
import 'package:info_bank/screens/createpost.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem(
      {required this.page, required this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const Home(),
          icon: const Icon(Icons.home),
          title: const Text("主頁"),
        ),
        TabNavigationItem(
          page: const Discover(),
          icon: const Icon(Icons.language),
          title: const Text("探索"),
        ),
        TabNavigationItem(
          page: CreatePost(),
          icon: const Icon(Icons.add_circle),
          title: const Text("創建貼文"),
        ),
        TabNavigationItem(
          page: const NotificationPage(),
          icon: const Icon(Icons.notifications),
          title: const Text("通知"),
        ),
        TabNavigationItem(
          page: Profile2(),
          icon: const Icon(Icons.person),
          title: const Text("個人"),
        ),
      ];
}
