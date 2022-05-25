import 'package:flutter/material.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class TabsViewModel extends AppViewModel {
  int currentIndex = 0;
  PageController controller = PageController();

  void onPageChanged(int index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic);
    updateIndex(index);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
