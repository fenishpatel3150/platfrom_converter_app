import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter_app/screen/provider/thememode_provider.dart';
import 'package:platfrom_converter_app/screen/view/Home_screen.dart';
import 'package:provider/provider.dart';

class Adaptive_screen extends StatelessWidget {
  const Adaptive_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? MaterialApp(
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode: Provider.of<themmode_provider>(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: home_screen(),
            debugShowCheckedModeBanner: false,
          )
        : CupertinoApp(
            theme: Provider.of<themmode_provider>(context).isdark
                ? CupertinoThemeData(brightness: Brightness.dark)
                : CupertinoThemeData(brightness: Brightness.light),
            home: home_screen(),
            debugShowCheckedModeBanner: false,
          );
  }
}
