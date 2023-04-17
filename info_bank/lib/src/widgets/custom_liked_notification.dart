import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/image_strings.dart';
import 'package:info_bank/src/constants/text_strings.dart';

class CustomLikedNotification extends StatelessWidget {
  const CustomLikedNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Stack(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(tAvatarImage3),
                ),
              ),
              Positioned(
                bottom: 10,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(tAvatarImage2),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                maxLines: 2,
                text: TextSpan(
                    text: "User 2",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: tPrimaryColor),
                    children: [
                      TextSpan(
                        text: " and ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: tSecondColor),
                      ),
                      const TextSpan(text: "User 3")
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Text(
          tStarNotification,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: tSecondColor),
        ),
      ],
    );
  }
}
