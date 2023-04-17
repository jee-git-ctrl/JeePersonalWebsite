import 'package:flutter/material.dart';
import 'package:info_bank/src/widgets/custom_answer_notification.dart';
import 'package:info_bank/src/widgets/custom_liked_notification.dart';
import 'package:info_bank/src/widgets/my_post.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/text_strings.dart';
import 'package:info_bank/src/utils/theme/widget_themes/text_theme.dart';

class NotificationScreen2 extends StatefulWidget {
  const NotificationScreen2({super.key});

  @override
  State<NotificationScreen2> createState() => _NotificationScreen2();
}

class _NotificationScreen2 extends State<NotificationScreen2> {
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
    post.add(
      const SizedBox(
        height: 16.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPost()),
                    );
                  },
                  child: const Text(tNotificationPost),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationAnswer()),
                    );
                  },
                  child: const Text(tNotificationAnswer),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationSystem()),
                    );
                  },
                  child: const Text(tNotificationSystem),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
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

class NotificationPost extends StatelessWidget {
  NotificationPost({super.key});
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
    post.add(
      const SizedBox(
        height: 16.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: post.length,
            itemBuilder: (context, index) {
              return MyPost(
                child: post[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

class NotificationAnswer extends StatelessWidget {
  NotificationAnswer({super.key});
  final List post = [
    'Answer 1',
    'Answer 2',
    'Answer 3',
    'Answer 4',
    'Answer 5',
    'Answer 6',
  ];
  int cnt = 0;
  void addpost() {
    post.add(
      const SizedBox(
        height: 16.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: post.length,
            itemBuilder: (context, index) {
              return MyPost(
                child: post[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

class NotificationSystem extends StatelessWidget {
  NotificationSystem({super.key});
  final List post = [
    'System 1',
    'System 2',
    'System 3',
    'System 4',
    'System 5',
    'System 6',
  ];
  int cnt = 0;
  void addpost() {
    post.add(
      const SizedBox(
        height: 16.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: post.length,
            itemBuilder: (context, index) {
              return MyPost(
                child: post[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
