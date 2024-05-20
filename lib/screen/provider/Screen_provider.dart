
import 'package:flutter/cupertino.dart';


class platfrom_provider extends ChangeNotifier
{
  bool isswitch=true;

  void platfrom(bool value)
  {
    isswitch=value;
    notifyListeners();
  }
}




