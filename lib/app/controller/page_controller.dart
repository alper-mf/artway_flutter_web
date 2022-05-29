import 'package:flutter/material.dart';

class PageOffsetNotifier with ChangeNotifier {
  double? offset = 0;
  double? page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      offset = pageController.offset;
      page = pageController.page;
      notifyListeners();
    });
  }
}
