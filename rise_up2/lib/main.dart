import 'package:flutter/material.dart';
import 'package:rise_up2/palette.dart';

import 'Pages/Missions/main_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Rise Up',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Palette.pColor,
    ),
    home:  MainPage(),
  );
}
}
