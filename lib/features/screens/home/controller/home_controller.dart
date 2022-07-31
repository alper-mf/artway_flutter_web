import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late ScrollController scrollViewController;
  final RxBool _isScrollingDown = false.obs;
  RxBool showAppbar = true.obs;

  HomeController() {
    scrollViewController = ScrollController();
    scrollListenerController();
  }

  scrollListenerController() {
    scrollViewController.addListener(() {
      if (scrollViewController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!_isScrollingDown.value) {
          _isScrollingDown.value = true;
          showAppbar.value = false;
        }
      }

      if (scrollViewController.position.userScrollDirection == ScrollDirection.forward) {
        if (_isScrollingDown.value) {
          _isScrollingDown.value = false;
          showAppbar.value = true;
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollViewController.dispose();
    scrollViewController.removeListener(() {});
  }
}
