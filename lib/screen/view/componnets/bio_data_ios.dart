import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter_app/screen/provider/image_picker_provider.dart';
import 'package:platfrom_converter_app/screen/provider/list_screen.dart';
import 'package:provider/provider.dart';

class bio_data_ios extends StatelessWidget {
  const bio_data_ios({super.key});

  @override
  Widget build(BuildContext context) {
    final listtrue = Provider.of<List_screen>(context, listen: true);
    final listfalse = Provider.of<List_screen>(context, listen: false);
    return Column(
      children: [
        CupertinoButton(
            child: (Provider.of<imagepicker_provider>(context)
                .imgpath !=
                null)?
                  CircleAvatar(
              backgroundImage: FileImage(
                  Provider.of<imagepicker_provider>(context)
                      .imgpath!),
              radius: 50,
            )
                : CircleAvatar(
              radius: 50,
              child: Icon(Icons.camera_alt_outlined),
            ),
            onPressed: () {
              Provider.of<imagepicker_provider>(context,
                  listen: false)
                  .imagpicker();
            }),
        SizedBox(height: 20,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(CupertinoIcons.person,color: Colors.blue,),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 25,left: 10),
                child: CupertinoTextField(
                  controller: listtrue.name,
                  placeholder: 'Full Name',
                  enabled: true,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(CupertinoIcons.phone,color: Colors.blue,),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 25,left: 10),
                child: CupertinoTextField(
                  controller: listtrue.number,
                  placeholder: 'Phone Number',
                  enabled: true,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(CupertinoIcons.chat_bubble_2,color: Colors.blue,),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 25,left: 10),
                child: CupertinoTextField(
                  controller: listtrue.msg,
                  placeholder: 'Chat Conversation',
                  enabled: true,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),

        CupertinoListTile(
            leading: Icon(CupertinoIcons.calendar,color: CupertinoColors.activeBlue,),
            title: CupertinoButton(
                onPressed: () {
                  showCupertinoModalPopup(context: context, builder: (context) => Container(
                    height: 250,
                    color: CupertinoColors.white,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime value) {
                        listfalse.DatePicker(value);
                      },),
                  ),);
                },
                child: Text('Pick Date'))),
        CupertinoListTile(
            leading: Icon(CupertinoIcons.time,color:CupertinoColors.activeBlue,),
            title: CupertinoButton(
                onPressed: ()
                {
                 showCupertinoModalPopup(context: context, builder: (context) => Container(
                   height: 250,
                   color: CupertinoColors.white,
                   child: CupertinoTimerPicker(mode: CupertinoTimerPickerMode.hms, onTimerDurationChanged: (Duration value) {

                   },),
                 ),);
                },
                child: Text('Pick Time'))),
        SizedBox(height: 30,),
        CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('Save',style: TextStyle(color: CupertinoColors.white),), onPressed: () {
          Addlist add = Addlist(
            image:listtrue.image, name:listtrue.name.text, number: listtrue.number.text,
            msg: listtrue.msg.text,
            timeOfDay: listtrue.Time,
            dateTime: listtrue.time,
          );
          listfalse.listmodel(add);

        },)
      ],
    );
  }
}
