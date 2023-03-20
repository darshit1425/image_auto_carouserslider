import 'package:flutter/cupertino.dart';

class Home_Provider extends ChangeNotifier {
  int CurrentImageIndex = 0;
  List Image = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.png",
    "assets/images/img5.png",
    "assets/images/img6.png",
    "assets/images/img7.png",
    "assets/images/img8.png",
    "assets/images/img9.png",
    "assets/images/img10.png",

  ];

  void changeindex(int index) {
    CurrentImageIndex = index;
    notifyListeners();
  }
}
