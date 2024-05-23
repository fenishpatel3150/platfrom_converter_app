

import 'package:flutter/cupertino.dart';
import 'package:platfrom_converter_app/adaptive/adaptive_screen.dart';
import 'package:platfrom_converter_app/screen/provider/Profile_imagepicker_provider.dart';
import 'package:platfrom_converter_app/screen/provider/Screen_provider.dart';
import 'package:platfrom_converter_app/screen/provider/image_picker_provider.dart';
import 'package:platfrom_converter_app/screen/provider/list_screen.dart';
import 'package:platfrom_converter_app/screen/provider/profile_provider.dart';
import 'package:platfrom_converter_app/screen/provider/thememode_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => platfrom_provider(),),
      ChangeNotifierProvider(create: (context) => imagepicker_provider(),),
      ChangeNotifierProvider(create: (context) => profile_provider(),),
      ChangeNotifierProvider(create: (context) => profileimagepicker_provider(),),
      ChangeNotifierProvider(create: (context) => themmode_provider(),),
      ChangeNotifierProvider(create: (context) => List_screen(),),
    ],
    child: Adaptive_screen());
  }
}

