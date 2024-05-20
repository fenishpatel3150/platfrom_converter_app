import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class  profileimagepicker_provider extends ChangeNotifier
{
    ImagePicker picker = ImagePicker();
    File? profileimagepath;

    Future<void> profilepath()
    async {

        XFile? images = await picker.pickImage(source: ImageSource.gallery);
        profileimagepath = File(images!.path);
        notifyListeners();
    }
}
