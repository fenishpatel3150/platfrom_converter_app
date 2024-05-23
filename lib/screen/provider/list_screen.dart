import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class List_screen extends ChangeNotifier
{


  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  File? image;
  List <Addlist>list=[];
  TextEditingController name =TextEditingController();
  TextEditingController number =TextEditingController();
  TextEditingController msg =TextEditingController();

  DateTime time=DateTime.now();
  void DatePicker(value){
    time=value!;
    notifyListeners();
  }

  TimeOfDay Time=TimeOfDay(hour: TimeOfDay.hoursPerDay, minute: TimeOfDay.minutesPerHour);
  void TimePicker(value){
    Time=value!;
    notifyListeners();
  }

  void listmodel(Addlist addlist)
  {
    list.add(addlist);
    log(list.length);
    notifyListeners();
  }

}

class Addlist
{
  File? image;
  String name;
  String number;
  String msg;
  DateTime dateTime;
  TimeOfDay timeOfDay;

  Addlist({required this.image,required this.name,required this.number,required this.msg, required this.dateTime,required this.timeOfDay});

}