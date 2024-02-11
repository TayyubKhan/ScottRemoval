import 'dart:io';

import 'package:flutter/cupertino.dart';

class PhotoViewViewModel with ChangeNotifier
{
  List<File> _imageFiles = List<File>.filled(12, File(''));
  List<File> get imageFiles=>_imageFiles ;
  void initialize(){
   _imageFiles = List<File>.filled(12, File(''));
  }
  void getimage(index,File image){
    _imageFiles[index]=image;
    notifyListeners();
  }
}