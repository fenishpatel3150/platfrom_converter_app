import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter_app/screen/provider/image_picker_provider.dart';
import 'package:platfrom_converter_app/screen/provider/list_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/profile_provider.dart';
import '../../provider/thememode_provider.dart';

class Setting_screen extends StatelessWidget {
  const Setting_screen({super.key});

  @override
  Widget build(BuildContext context) {

    final listtrue = Provider.of<List_screen>(context, listen: true);
    final listfalse = Provider.of<List_screen>(context, listen: false);
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
              backgroundImage: FileImage(Provider
                  .of<imagepicker_provider>(context)
                  .imgpath!),
            ),
            CupertinoTextFormFieldRow(
              controller: listtrue.name,
              textAlign: TextAlign.center,
              enabled: true,
              placeholder: 'Enter Your Name .....',
            ),
            CupertinoTextFormFieldRow(
              controller: listtrue.msg,
              textAlign: TextAlign.center,
              enabled: true,
              placeholder: 'Enter your Bio .....',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(child: Text('Save'), onPressed: ()
                {

                  Addlist add = Addlist(
                    image:listtrue.image, name:listtrue.name.text, number: listtrue.number.text,
                    msg: listtrue.msg.text,
                    timeOfDay: listtrue.Time,
                    dateTime: listtrue.time,
                  );
                  listfalse.listmodel(add);
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
