import 'package:flutter/material.dart';
import 'package:platfrom_converter_app/screen/provider/list_screen.dart';
import 'package:provider/provider.dart';

class Call_Screen extends StatelessWidget {
  const Call_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final listtrue = Provider.of<List_screen>(context,listen: true);
    final listfalse = Provider.of<List_screen>(context,listen: false);


    return Scaffold(
      body: Column(
          children: List.generate(listtrue.list.length, (index) => ListTile(
            leading: CircleAvatar(
              radius: 30,
            ),
            title: Text(listtrue.list[index].name),
            subtitle: Text(listtrue.list[index].msg),
            trailing: Icon(Icons.phone),
          ),
          )

      ),
    );
  }
}
