import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? pickedImg;
  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxWidth: 150,
    );
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      pickedImg = pickedImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImage,
      child: CircleAvatar(
          radius: 70,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            radius: 65,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(65),
              child: pickedImg == null
                  ? const Icon(Icons.camera_enhance_rounded)
                  : Image.file(pickedImg!),
            ),
          )),
    );
  }
}
