import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zr/helpers/colors.dart';
import 'package:zr/widgets/achievements.dart';
import 'package:zr/widgets/profile_tile.dart';
import '../components/profile/user_image_picker.dart';
import '../components/profile/edit_sheet.dart';

final auth = FirebaseAuth.instance;
final User? user = auth.currentUser;

class Profile extends StatefulWidget {
  static const routeName = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _pickedImage;

  void _signOut(BuildContext context) async {
    await auth.signOut();
  }

  void save() async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${user!.uid}.jpg');
    await storageRef.putFile(_pickedImage!);
    final imageUrl = await storageRef.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: save,
            child: const Text(
              'Save Changes',
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
              Center(
                child: Column(
                  children: [
                    UserImagePicker(
                      imagePickFn: (pickedImage) {
                        _pickedImage = pickedImage;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onDoubleTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const EditProfileSheet(),
                        );
                      },
                      child: Text(
                        user != null
                            ? user!.displayName.toString()
                            : 'User Name',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
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
