import 'package:flutter/material.dart';
import 'package:platfrom_converter_app/screen/provider/Profile_imagepicker_provider.dart';
import 'package:platfrom_converter_app/screen/provider/list_screen.dart';
import 'package:platfrom_converter_app/screen/provider/profile_provider.dart';
import 'package:platfrom_converter_app/screen/provider/thememode_provider.dart';
import 'package:provider/provider.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {

    final listtrue = Provider.of<List_screen>(context, listen: true);
    final listfalse = Provider.of<List_screen>(context, listen: false);
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          subtitle: Text('Update Profile Data'),
          trailing: Switch(
            value: Provider.of<profile_provider>(context).isprofile,
            onChanged: (value) {
              Provider.of<profile_provider>(context, listen: false)
                  .showprofile(value);
            },
          ),
        ),
        (Provider.of<profile_provider>(context).isprofile)
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Provider.of<profileimagepicker_provider>(
                      context,
                      listen: false)
                      .profilepath();
                },
                child:
                (Provider.of<profileimagepicker_provider>(
                    context)
                    .profileimagepath !=
                    null)
                    ? CircleAvatar(
                  backgroundImage: FileImage(Provider
                      .of<profileimagepicker_provider>(
                      context)
                      .profileimagepath!),
                  radius: 50,
                )
                    : CircleAvatar(
                  radius: 50,
                  child:
                  Icon(Icons.camera_alt_outlined),
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: listtrue.name,
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                hintText: 'Enter your Name...',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: listtrue.msg,
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                hintText: 'Enter you Bio....',
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {

                      Addlist add = Addlist(
                        image:listtrue.image, name:listtrue.name.text, number: listtrue.number.text,
                        msg: listtrue.msg.text,
                        timeOfDay: listtrue.Time,
                        dateTime: listtrue.time,
                      );
                      listfalse.listmodel(add);

                    }, child: Text('Save')),
                ElevatedButton(
                    onPressed: () {}, child: Text('Clear')),
              ],
            )
          ],
        )
            : Container(),
        ListTile(
          leading: Icon(Icons.sunny),
          title: Text('Theme'),
          subtitle: Text('Chnage Theme'),
          trailing: Switch(
            value: Provider.of<themmode_provider>(context).isdark,
            onChanged: (value) {
              Provider.of<themmode_provider>(context, listen: false)
                  .chnagetheme(value);
            },
          ),
        ),
      ],
    );;
  }
}
