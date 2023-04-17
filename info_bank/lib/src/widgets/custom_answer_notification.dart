import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/image_strings.dart';
import 'package:info_bank/src/constants/text_strings.dart';

class CustomAnswerNotification extends StatefulWidget {
  const CustomAnswerNotification({super.key});

  @override
  State<CustomAnswerNotification> createState() =>
      _CustomAnswerNotificationState();
}

class _CustomAnswerNotificationState extends State<CustomAnswerNotification> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(tAvatarImage1),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "User 1",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: tPrimaryColor),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        Text(
          tAnswerNotification,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: tSecondColor),
        )
      ],
    );
  }
}
