import 'package:flutter/material.dart';
import 'package:platfrom_converter_app/screen/provider/Screen_provider.dart';
import 'package:platfrom_converter_app/screen/provider/image_picker_provider.dart';
import 'package:provider/provider.dart';

class person_biodata extends StatelessWidget {
  const person_biodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: InkWell(
            onTap: ()
            {
              Provider.of<imagepicker_provider>(context,listen: false).imagpicker();

            },
            child:  (Provider.of<imagepicker_provider>(context).imgpath!=null)?
            CircleAvatar(
              backgroundImage: FileImage(Provider.of<imagepicker_provider>(context).imgpath!),
              radius: 50,
            )  : CircleAvatar(
              radius: 50,
              child: Icon(Icons.camera_alt_outlined),
            )),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 50,
            width: 330,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'full Name',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 50,
            width: 330,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Phone Number ',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 50,
            width: 330,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Chat Conversation ',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.date_range),
              SizedBox(
                width: 10,
              ),
              Text('Pick Date'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Icon(Icons.watch_later_outlined),
              SizedBox(
                width: 10,
              ),
              Text('Pick Time'),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xffe9dcff)),
            ),
            child: Center(child: Text('Save')),
          ),
        )
      ],
    );
  }
}
