
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platfrom_converter_app/screen/provider/Profile_imagepicker_provider.dart';
import 'package:platfrom_converter_app/screen/provider/Screen_provider.dart';
import 'package:platfrom_converter_app/screen/provider/image_picker_provider.dart';
import 'package:platfrom_converter_app/screen/provider/profile_provider.dart';
import 'package:platfrom_converter_app/screen/provider/thememode_provider.dart';
import 'package:platfrom_converter_app/screen/view/componnets/bio_data_ios.dart';
import 'package:platfrom_converter_app/screen/view/componnets/person_bio_data.dart';
import 'package:platfrom_converter_app/screen/view/componnets/profile_screen.dart';
import 'package:provider/provider.dart';

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
              Center(child: Text('home')),
              Center(child: Text('home')),
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
                return Column(
                  children: [
                    
                  ],
                );
              } else if (index == 2) {
                return Column(
                  children: [

                  ],
                );
              } else if (index == 3) {
                return Column(
                  children: [
                    CupertinoListTile(
                        leading: Icon(Icons.person),
                        title: Text('Profile'),
                        subtitle: Text('Update Profile Data'),
                      trailing: CupertinoSwitch(value: Provider.of<profile_provider>(context).isprofile, onChanged: (value) {
                        Provider.of<profile_provider>(context, listen: false)
                            .showprofile(value);
                      },),
                    ),
                    (Provider.of<profile_provider>(context).isprofile)
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(radius: 50,
                              child: Icon(CupertinoIcons.camera),
                            ),
                            CupertinoTextFormFieldRow(
                            enabled: true,
                              placeholder: 'Enter Your Name .....',
                            ),
                            CupertinoTextFormFieldRow(
                              enabled: true,
                              placeholder: 'Enter your Bio .....',
                            ),
                            Row(
                              children: [
                                CupertinoButton(child: Text('Save'), onPressed: ()
                                {

                                }),
                                CupertinoButton(child: Text('Clear'), onPressed: ()
                                {

                                }),
                              ],
                            )
                          ],
                        )
                        : Container(),
                    CupertinoListTile(
                        leading: Icon(Icons.sunny),
                        title: Text('Theme'),
                        subtitle: Text('Chanage Theme'),
                      trailing: CupertinoSwitch(value: Provider.of<themmode_provider>(context).isdark, onChanged: (value) {
                        Provider.of<themmode_provider>(context,listen: false).chnagetheme(value);
                      },),
                    ),

                  ],
                );
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
