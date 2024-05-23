import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/profile_provider.dart';
import '../../provider/thememode_provider.dart';

class Setting_screen extends StatelessWidget {
  const Setting_screen({super.key});

  @override
  Widget build(BuildContext context) {
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
          children: [
            CircleAvatar(radius: 50,
              child: Icon(CupertinoIcons.camera),
            ),
            CupertinoTextFormFieldRow(
              textAlign: TextAlign.center,
              enabled: true,
              placeholder: 'Enter Your Name .....',
            ),
            CupertinoTextFormFieldRow(
              textAlign: TextAlign.center,
              enabled: true,
              placeholder: 'Enter your Bio .....',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
  }
}
