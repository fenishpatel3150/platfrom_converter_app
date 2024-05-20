
import 'package:flutter/material.dart';

class profile_provider extends ChangeNotifier
{
  bool isprofile=false;

  void showprofile(bool value)
  {
    isprofile=value;
    notifyListeners();
  }
}