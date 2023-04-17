import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/images/avatar1.png"),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          width: 350,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: const Text('標志解答次數:'),
        ),
      ],
    );
  }
}
