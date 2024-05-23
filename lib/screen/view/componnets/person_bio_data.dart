import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platfrom_converter_app/screen/provider/image_picker_provider.dart';
import 'package:platfrom_converter_app/screen/provider/list_screen.dart';
import 'package:provider/provider.dart';

class person_biodata extends StatelessWidget {
  const person_biodata({super.key});


  @override
  Widget build(BuildContext context) {
    final listtrue = Provider.of<List_screen>(context, listen: true);
    final listfalse = Provider.of<List_screen>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: InkWell(
                onTap: () {
                  Provider.of<imagepicker_provider>(context, listen: false)
                      .imagpicker();
                },
                child: (Provider
                    .of<imagepicker_provider>(context)
                    .imgpath != null) ?
                CircleAvatar(
                  backgroundImage: FileImage(Provider
                      .of<imagepicker_provider>(context)
                      .imgpath!),
                  radius: 50,
                ) : CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.camera_alt_outlined),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.person),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: listtrue.name,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.phone),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: listtrue.number,
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
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.message),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: listtrue.msg,
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
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      showDatePicker(context: context,
                          firstDate: DateTime(1999),
                          lastDate: DateTime(2024)).then((value) => listfalse.DatePicker(value));
                    },
                    child: Text('Pick Date')),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text('${listtrue.time.day}/${listtrue.time.month}/${listtrue.time.year}'),
                )

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
                InkWell(
                    onTap: () {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now()).then((value) => listfalse.TimePicker(value));
                    },
                    child: Text('Pick Time')),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text('${listtrue.Time.hour}:${listtrue.Time.minute}'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              Addlist add = Addlist(
                  image:listtrue.image,
                name:listtrue.name.text, number: listtrue.number.text,
                  msg: listtrue.msg.text,
                  timeOfDay: listtrue.Time,
                  dateTime: listtrue.time,
              );
              listfalse.listmodel(add);
              },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black
              ),
              child: Center(
                  child: Text('Save', style: TextStyle(color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }
}
