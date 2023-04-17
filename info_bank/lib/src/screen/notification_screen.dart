import 'package:flutter/material.dart';
import 'package:info_bank/src/widgets/my_post.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/text_strings.dart';
import 'package:info_bank/src/utils/theme/widget_themes/text_theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen> {
  final List post = [
    'QA 1',
    'QA 2',
    'QA 3',
    'QA 4',
    'QA 5',
    'QA 6',
  ];
  int cnt = 0;
  void addpost() {
    post.add(const SizedBox(
      height: 16.0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('通知'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            height: 18,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(8 * baseWidth),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(tNotificationPost),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(tNotificationAnswer),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(tNotificationSystem),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            height: 12,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(8 * baseWidth),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: post.length,
                itemBuilder: (context, index) {
                  return MyPost(
                    child: post[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
