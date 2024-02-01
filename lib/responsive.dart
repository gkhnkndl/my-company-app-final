import 'package:flutter/material.dart';

//ekran boyutunun tespitinin bulunduğu responsive ekranı
enum Screen { mobile, tablet, desktop }

detectScreen(Size size) {
  if (size.width < 600) {
    return Screen.mobile;
  } else if (size.width < 840) {
    return Screen.tablet;
  } else {
    return Screen.desktop;
  }
}
