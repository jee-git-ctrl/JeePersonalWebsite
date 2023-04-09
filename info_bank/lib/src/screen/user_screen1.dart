import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/image_strings.dart';
import 'package:info_bank/src/constants/sizes.dart';
import 'package:info_bank/src/constants/text_strings.dart';
import 'package:info_bank/src/utils/theme/widget_themes/text_theme.dart';
import 'package:info_bank/src/widgets/my_post.dart';

class UserScreen1 extends StatelessWidget {
  const UserScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tUserProfile,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          width: 450,
          height: 250,
          decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      tUserProfileName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(image: AssetImage(tAvatarImage1))),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      tUserHeading1,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      tUserHeading2,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      tUserHeading3,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      tUserHeading4,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      tUserHeading5,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      tUserHeading6,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                const Divider(),
              ]),
        ),
      ),
    );
  }
}
