import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.imagePickFn});

  final void Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? pickedImg;
  String imgUrl = '';

  void firebaseData() async {
    final auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    if(userData.data()?['imageUrl'] == null){
      return;
    }
    String imageUrl = userData.data()!['imageUrl'];
    if (pickedImg != null) {
      return;
    }
    setState(() {
      imgUrl = imageUrl;
    });
  }

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImg = File(pickedImage.path);
    });

    widget.imagePickFn(pickedImg!);
  }

  @override
  Widget build(BuildContext context) {
    firebaseData();
    return InkWell(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 70,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          radius: 65,
          backgroundImage: pickedImg != null
              ? FileImage(pickedImg!)
              // ignore: unnecessary_null_comparison
              : imgUrl != null
                  ? NetworkImage(imgUrl)
                  : Image.asset('assets/profile.png').image,
        ),
      ),
    );
  }
}
