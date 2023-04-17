import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/colors.dart';

class MyPost extends StatelessWidget {
  final String child;

  const MyPost({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 80,
        color: tPrimaryColor,
        child: Center(
            child: Text(
          child,
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
    );
  }
}
