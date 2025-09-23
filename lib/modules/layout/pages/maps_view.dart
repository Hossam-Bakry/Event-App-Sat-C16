import 'package:flutter/material.dart';

class MapsView extends StatelessWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Text(
        "Maps",
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineSmall?.copyWith(color: Colors.black),
      ),
    );
  }
}
