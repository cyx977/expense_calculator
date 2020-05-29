import 'package:flutter/material.dart';

AppBar appBar = AppBar(
  title: Text(
    'Personal Expenses',
  ),
);

final pageTransitionsTheme =
    PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: ZoomPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
  TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
});
