import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_bank/screens/QApage.dart';
import 'package:info_bank/screens/tmpQApage.dart';
import 'package:info_bank/src/constants/colors.dart';

class Post {
  final String title;
  final List<String> tag;
  final double Best;
  final double unlocked;
  final bool isfollowed;
  const Post({
    required this.title,
    required this.tag,
    required this.Best,
    required this.unlocked,
    required this.isfollowed,
  });
}

const allPost = [
  Post(
      title: '古城麻辣燙排隊人數',
      tag: ['食', 'CCU', '大吃'],
      Best: 89.1,
      unlocked: 3000,
      isfollowed: true),
  Post(
      title: '大吃還有機車停車位嗎',
      tag: ['停車位', 'CCU', '大吃'],
      Best: 71.1,
      unlocked: 1234,
      isfollowed: false),
  Post(
      title: '今天有丹丹蔥油餅嗎',
      tag: ['美食', 'CCU', '大吃'],
      Best: 67.4,
      unlocked: 5678,
      isfollowed: true),
  Post(
      title: '共教錢包遺失',
      tag: ['CCU', '遺失', '失物協尋'],
      Best: 82.2,
      unlocked: 9876,
      isfollowed: false),
  Post(
      title: '中正大學重要時程',
      tag: ['CCU', '行事曆'],
      Best: 23.3,
      unlocked: 2351,
      isfollowed: true),
  Post(
      title: '大士爺攤販評價',
      tag: ['大士爺'],
      Best: 54.8,
      unlocked: 3000,
      isfollowed: false),
  Post(
      title: '民雄區車況',
      tag: ['交通'],
      Best: 31.5,
      unlocked: 2881,
      isfollowed: false),
];

const samePost = [
  Post(
      title: '古城排隊人數',
      tag: ['Follow'],
      Best: 89.1,
      unlocked: 3000,
      isfollowed: true),
  Post(
      title: '古城麻辣燙候位人數',
      tag: ['Follow'],
      Best: 71.1,
      unlocked: 1234,
      isfollowed: true),
  Post(
      title: '古城還要多久',
      tag: ['Follow'],
      Best: 67.4,
      unlocked: 5678,
      isfollowed: true),
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
              color: tThirdColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 110,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: SizedBox(
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
                SizedBox(
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
                                    backgroundColor: tFifthColor,
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
                      SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "最佳回答：${currentpost.Best}%",
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
                              child: SizedBox(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "解鎖次數：${(currentpost.unlocked / 1000).toStringAsFixed(1)}k",
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

class SamePost extends StatelessWidget {
  final Post currentpost;

  SamePost({required this.currentpost});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const QApage()));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: tThirdColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 30,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                    child: SizedBox(
                      height: 20,
                      child: Text(
                        //title
                        currentpost.title,
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: tDarkColor,
                        ),
                      ),
                    ),
                  ),
                ),
                /*
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
                                    backgroundColor: tFifthColor,
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
                */
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
