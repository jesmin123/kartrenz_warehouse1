import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BasicProvider extends ChangeNotifier{

  PlatformFile _engineVideo;

  PlatformFile get engineVideo => _engineVideo;

  set engineVideo(PlatformFile value) {
    _engineVideo = value;
    notifyListeners();
  }


}