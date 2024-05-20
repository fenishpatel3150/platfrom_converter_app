import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter_app/screen/provider/image_picker_provider.dart';
import 'package:provider/provider.dart';

class bio_data_ios extends StatelessWidget {
  const bio_data_ios({super.key});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.only(right: 20),
                child: CupertinoTextField(
                  placeholder: 'Full Name',
                  enabled: true,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                padding: const EdgeInsets.only(right: 20),
                child: CupertinoTextField(
                  placeholder: 'Phone Number',
                  enabled: true,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                padding: const EdgeInsets.only(right: 20),
                child: CupertinoTextField(
                  placeholder: 'Chat Conversation',
                  enabled: true,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        CupertinoListTile(
            leading: Icon(CupertinoIcons.calendar,color: CupertinoColors.activeBlue,),
            title: Text('Pick Date')),
        CupertinoListTile(
            leading: Icon(CupertinoIcons.time,color:CupertinoColors.activeBlue,),
            title: Text('Pick Time')),
        CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('Save',style: TextStyle(color: CupertinoColors.white),), onPressed: () {

        },)
      ],
    );
  }
}
