import 'package:flutter/material.dart';
import 'package:info_bank/sidemenu/side_menu.dart';
import 'package:info_bank/screens/search.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/image_strings.dart';
import 'package:info_bank/src/constants/sizes.dart';
import 'package:info_bank/src/constants/text_strings.dart';
import 'package:info_bank/screens/update_user_screen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: IconButton(
                icon: const Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        //backgroundColor: Color(0xffd9d9d9),
        elevation: 0.0,
        title: Text(
          tUserProfile,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 13),
            child: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Search()));
                  //Navigator.pushNamed(context, '/search');
                }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(tAvatarImage1)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: tPrimaryColor),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tUserProfileName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                tUserProfileHeading,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const UpdateUserProfileScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text('自訂個人名片'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: tThirdColor,
              ),
              const SizedBox(
                height: 10,
              ),

              ///Menu
              ProfileMenuWidget(
                  title: "Feedback of the best one",
                  subtitle: 4,
                  icon: Icons.star,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Total number of good and best",
                  subtitle: 4,
                  icon: Icons.favorite,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Number of request",
                  subtitle: 4,
                  icon: Icons.device_unknown_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Average rating per significant answer",
                  subtitle: 4,
                  icon: Icons.crisis_alert_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Number of significant answer",
                  subtitle: 4,
                  icon: Icons.functions,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final int subtitle;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: tSecondColor.withOpacity(0.1)),
        child: Icon(
          icon,
          color: tSecondColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall?.apply(color: textColor),
      ),
      subtitle: Text(
        subtitle.toString(),
        style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.chevron_right,
                size: 18,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
