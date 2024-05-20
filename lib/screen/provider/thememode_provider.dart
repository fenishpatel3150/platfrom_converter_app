import 'package:flutter/cupertino.dart';

class themmode_provider extends ChangeNotifier
{
  bool isdark=false;

  void chnagetheme (bool value)
  {
    isdark = value;
    notifyListeners();
  }
}