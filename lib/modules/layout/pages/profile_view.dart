import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Text(
        "Profile",
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineSmall?.copyWith(color: Colors.black),
      ),
    );
  }
}
