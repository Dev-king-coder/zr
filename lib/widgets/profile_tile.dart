import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTile extends StatelessWidget {
  final void Function() onTap;
  final IconData leading;
  final String title;
  const ProfileTile({
    required this.onTap,
    required this.leading,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: FaIcon(
        leading,
        size: 15,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 12),
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}
