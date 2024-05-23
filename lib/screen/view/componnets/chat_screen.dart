import 'package:flutter/material.dart';
import 'package:platfrom_converter_app/screen/provider/image_picker_provider.dart';
import 'package:platfrom_converter_app/screen/provider/list_screen.dart';
import 'package:provider/provider.dart';

class Chat_Screen extends StatelessWidget {
  const Chat_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final listtrue = Provider.of<List_screen>(context,listen: true);
    final listfalse = Provider.of<List_screen>(context,listen: false);


    return Scaffold(
      body: Column(
        children: List.generate(listtrue.list.length, (index) => ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: FileImage(Provider
                .of<imagepicker_provider>(context)
                .imgpath!),
          ),
          title: Text(listtrue.list[index].name),
          subtitle: Text(listtrue.list[index].msg),
          trailing: Text("${listtrue.time.day}/${listtrue.time.month}/${listtrue.time.year}"),
        ),
        )

      ),
    );
  }
}
