import 'package:flutter/material.dart';
import 'package:soc/utils/size_config.dart';
import 'package:soc/utils/theme.dart';
import 'package:stacked/stacked.dart';

import 'soc_nav_bar_view_model.dart';

class SOCNavBar extends StatelessWidget {
  const SOCNavBar({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SOCNavBarViewModel>.reactive(
      onModelReady: (m) => m.onModelReady(
        controller,
      ),
      builder: (context, model, child) => Container(
        margin: const EdgeInsets.fromLTRB(16, 2, 16, 16),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: getProportionateScreenHeight(74),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyTheme.whiteColor,
          borderRadius: BorderRadius.circular(
            getProportionateScreenHeight(37),
          ),
          boxShadow: const [
            BoxShadow(
                color: MyTheme.shadowColor, offset: Offset(5, 5), blurRadius: 8)
          ],
        ),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(
                index: 0,
                text: "Home",
                model: model,
                imagePath: "assets/images/home_icon.png",
              ),
              navItem(
                index: 1,
                text: "Search",
                model: model,
                imagePath: "assets/images/search_icon.png",
              ),
              navItem(
                index: 2,
                text: "Virtual Office",
                model: model,
                imagePath: "assets/images/screen_icon.png",
              ),
              navItem(
                index: 3,
                text: "Account",
                model: model,
                imagePath: "assets/images/person_icon.png",
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SOCNavBarViewModel(),
    );
  }

  Widget navItem(
      {required int index,
      required SOCNavBarViewModel model,
      required String text,
      required String imagePath}) {
    final isSelected = model.currentIndex == index;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => model.onTapNavItem(index),
        child: Container(
          width: getProportionateScreenWidth(76),
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: isSelected ? MyTheme.mainColor : Colors.transparent,
              ),
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                color: isSelected ? MyTheme.mainColor : MyTheme.grey,
                height: 20,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? MyTheme.mainColor : MyTheme.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
