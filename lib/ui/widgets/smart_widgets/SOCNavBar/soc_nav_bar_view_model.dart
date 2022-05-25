import 'package:flutter/material.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class SOCNavBarViewModel extends AppViewModel {
  late PageController _controller;
  late int currentIndex;

  void onModelReady(PageController controller) {
    _controller = controller;
    _controller.addListener(() {
      currentIndex = _controller.page?.toInt()??0;
      notifyListeners();
    });
    currentIndex = _controller.initialPage;
  }

  void onTapNavItem(int index) {
    _controller.animateToPage(index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic);
    currentIndex = index;
    notifyListeners();
  }
}
