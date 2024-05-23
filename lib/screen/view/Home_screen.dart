
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter_app/screen/provider/Screen_provider.dart';
import 'package:platfrom_converter_app/screen/view/componnets/bio_data_ios.dart';
import 'package:platfrom_converter_app/screen/view/componnets/call_screen.dart';
import 'package:platfrom_converter_app/screen/view/componnets/chat_screen.dart';
import 'package:platfrom_converter_app/screen/view/componnets/person_bio_data.dart';
import 'package:platfrom_converter_app/screen/view/componnets/profile_screen.dart';
import 'package:provider/provider.dart';

import 'componnets/setting_screen.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {


    if (Provider.of<platfrom_provider>(context).isswitch) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Platfrom Convetor'),
            actions: [
              Switch(
                value: Provider.of<platfrom_provider>(context).isswitch,
                onChanged: (value) {
                  Provider.of<platfrom_provider>(context, listen: false)
                      .platfrom(value);
                },
              ),
            ],
          ),
          body: ContainedTabBarView(
            tabs: [
              Icon(Icons.perm_identity_outlined),
              Text('CHATS'),
              Text('CALLS'),
              Text('SETTING'),
            ],
            views: [
              person_biodata(),
              Chat_Screen(),
              Call_Screen(),
              profile_screen(),
            ],
          ));
    } else {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Platfrom Convetor'),
          trailing: CupertinoSwitch(
            value: Provider.of<platfrom_provider>(context).isswitch,
            onChanged: (value) {
              Provider.of<platfrom_provider>(context, listen: false)
                  .platfrom(value);
            },
          ),
        ),
        child: SafeArea(
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(currentIndex: 0, items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
            ]),
            tabBuilder: (context, index) {
              if (index == 0) {
                return bio_data_ios();
              } else if (index == 1) {
                return Chat_Screen();
              } else if (index == 2) {
                return Call_Screen();
              } else if (index == 3) {
                return Setting_screen();
              } else {
                return Text('hello');
              }
            },
          ),
        ),
      );
    }
  }



}
