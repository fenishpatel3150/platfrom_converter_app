
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagepicker_provider extends ChangeNotifier
{

  ImagePicker picker = ImagePicker();
  File? imgpath;

  void imagpicker()
  async {
    XFile? images = await picker.pickImage(source: ImageSource.gallery);
    imgpath = File(images!.path);
    notifyListeners();
  }
}