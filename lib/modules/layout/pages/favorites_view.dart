import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Text(
        "Favorites",
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineSmall?.copyWith(color: Colors.black),
      ),
    );
  }
}
