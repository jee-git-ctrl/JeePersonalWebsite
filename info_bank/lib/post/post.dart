import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/screens/QApage.dart';
import 'package:info_bank/src/constants/colors.dart';

class Post {
  final String title;
  final List<String> tag;
  final double Best;
  final double unlocked;
  const Post({
    required this.title,
    required this.tag,
    required this.Best,
    required this.unlocked,
  });
}

const allPost = [
  Post(title: '古城麻辣燙排隊人數', tag: ['Follow'], Best: 89.1, unlocked: 3000),
  Post(title: 'Post 2', tag: ['Follow'], Best: 71.1, unlocked: 1234),
  Post(
      title: 'Post 3',
      tag: ['Follow', 'Fooooooooooooooooooooooooooooooooood'],
      Best: 67.4,
      unlocked: 5678),
  Post(
      title: 'Post 4',
      tag: ['Recommend', 'afkjno'],
      Best: 82.2,
      unlocked: 9876),
  Post(title: 'Post 5', tag: ['Follow'], Best: 23.3, unlocked: 2351),
  Post(title: 'Post 6', tag: ['Recommend'], Best: 23.3, unlocked: 2351),
  Post(title: 'Post 7', tag: ['Follow'], Best: 23.3, unlocked: 2351),
  Post(title: 'Post 8', tag: ['Recommend'], Best: 23.3, unlocked: 2351),
  Post(title: 'Post 9', tag: ['Recommend'], Best: 23.3, unlocked: 2351),
  Post(title: 'Post 10', tag: ['Recommend'], Best: 23.3, unlocked: 2351),
];

class MyPost extends StatelessWidget {
  final Post currentpost;

  MyPost({required this.currentpost});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QApage()));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: tSecondColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 110,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    child: Container(
                      height: 50,
                      child: Text(
                        //title
                        currentpost.title,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: tDarkColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final maxWidth = 250;
                            int currentwidth = 0;
                            List<String> visibleTags = [];

                            for (var i = 0; i < currentpost.tag.length; i++) {
                              final tagText = currentpost.tag[i];
                              final tagSize = _textSize(tagText);

                              if (visibleTags.isEmpty ||
                                  currentwidth + tagSize.width <= maxWidth) {
                                currentwidth + tagSize.width;
                                visibleTags.add(tagText);
                              } else {
                                break;
                              }
                            }

                            return Wrap(
                              children: List<Widget>.generate(
                                  visibleTags.length, (int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, left: 8, right: 8),
                                  child: Chip(
                                    backgroundColor: tSevenColor,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    label: Text(
                                      visibleTags[index],
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        color: tDarkColor,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "最佳回答：" + currentpost.Best.toString() + "%",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 8),
                              child: Container(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "解鎖次數：" +
                                        (currentpost.unlocked / 1000)
                                            .toStringAsFixed(1) +
                                        "k",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    print(textPainter.size);
    return textPainter.size;
  }
}
