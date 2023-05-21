import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zr/helpers/colors.dart';
import 'package:zr/widgets/achievements.dart';
import 'package:zr/widgets/profile_tile.dart';
import '../components/profile/user_image_picker.dart';
import '../components/profile/edit_sheet.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Column(
                  children: [
                    UserImagePicker(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Rounak Agrawal',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CustomTheme.themeAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(FontAwesomeIcons.trophy, size: 16),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Rookie',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ProfileAchievements(
                        value: '2121',
                        title: 'Points',
                      ),
                    ),
                    Expanded(
                      child: ProfileAchievements(
                        value: '5',
                        title: 'Days Streak',
                      ),
                    ),
                    Expanded(
                      child: ProfileAchievements(
                        value: '3',
                        title: 'Rank',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ProfileTile(
                leading: FontAwesomeIcons.user,
                title: 'Edit Profile',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const EditProfileSheet(),
                  );
                },
              ),
              ProfileTile(
                leading: FontAwesomeIcons.star,
                title: 'My Achievements',
                onTap: () {},
              ),
              ProfileTile(
                leading: FontAwesomeIcons.arrowRightFromBracket,
                title: 'Sign Out',
                onTap: () => _signOut(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
