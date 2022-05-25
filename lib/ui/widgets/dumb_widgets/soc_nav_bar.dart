import 'package:flutter/material.dart';
import 'package:soc/utils/size_config.dart';
import 'package:soc/utils/theme.dart';

class SOCNavBar extends StatelessWidget {
  const SOCNavBar({Key? key, required this.onTapItem, this.currentIndex = 0})
      : super(key: key);
  final void Function(int) onTapItem;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: buildItems(),
    );
  }

  Row buildItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        navItem(
          index: 0,
          text: "Home",
          imagePath: "assets/images/home_icon.png",
        ),
        navItem(
          index: 1,
          text: "Search",
          imagePath: "assets/images/search_icon.png",
        ),
        navItem(
          index: 2,
          text: "Virtual Office",
          imagePath: "assets/images/screen_icon.png",
        ),
        navItem(
          index: 3,
          text: "Account",
          imagePath: "assets/images/person_icon.png",
        ),
      ],
    );
  }

  Widget navItem(
      {required int index,
      required String text,
      required String imagePath}) {
    final isSelected = currentIndex == index;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTapItem(index),
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
              itemIcon(imagePath, isSelected),
              padding(),
              itemText(text, isSelected)
            ],
          ),
        ),
      ),
    );
  }

  Text itemText(String text, bool isSelected) {
    return Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: isSelected ? MyTheme.mainColor : MyTheme.grey,
      ),
    );
  }

  SizedBox padding() {
    return const SizedBox(
      height: 8,
    );
  }

  Image itemIcon(String imagePath, bool isSelected) {
    return Image.asset(
      imagePath,
      color: isSelected ? MyTheme.mainColor : MyTheme.grey,
      height: 20,
    );
  }
}
