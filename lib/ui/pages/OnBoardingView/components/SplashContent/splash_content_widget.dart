import 'package:flutter/material.dart';

import '../../../../../utils/size_config.dart';
import '../../../../../utils/theme.dart';

class SplashContent extends StatelessWidget {
  final String? textHeading;
  final String? textDescription;
  final String? image;
  final int? index;

  const SplashContent({
    Key? key,
    this.textHeading,
    this.textDescription,
    this.image,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 150),
              child: drawCircles(
                17,
                this.index == 0
                    ? MyTheme.yellowColor
                    : this.index == 1
                        ? MyTheme.skyBlue
                        : this.index == 2
                            ? MyTheme.lightRed
                            : MyTheme.lightRed,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 250),
              child: drawCircles(
                20,
                this.index == 0
                    ? MyTheme.skyBlue
                    : this.index == 1
                        ? MyTheme.lightRed
                        : this.index == 2
                            ? MyTheme.yellowColor
                            : MyTheme.lightRed,
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(180),
                image: DecorationImage(
                  image: AssetImage(
                    this.image!,
                  ),
                  fit: BoxFit.fill,
                ),
                color: this.index == 0
                    ? MyTheme.skyBlue
                    : this.index == 1
                        ? MyTheme.yellowColor
                        : this.index == 2
                            ? MyTheme.lightRed
                            : MyTheme.lightRed,
              ),
              height: getProportionateScreenHeight(250),
              width: getProportionateScreenWidth(250),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 150),
              child: drawCircles(
                10,
                this.index == 0
                    ? MyTheme.lightRed
                    : this.index == 1
                        ? MyTheme.skyBlue
                        : this.index == 2
                            ? MyTheme.yellowColor
                            : MyTheme.lightRed,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 280),
              child: drawCircles(
                15,
                this.index == 0
                    ? MyTheme.yellowColor
                    : this.index == 1
                        ? MyTheme.skyBlue
                        : this.index == 1
                            ? MyTheme.lightRed
                            : MyTheme.lightRed,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                this.textHeading!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lorem ipsum dolor sit \n amet, consectetur\n adipiscing elit. Nisi, ",
                style: TextStyle(
                  fontSize: 18,
                ),
                maxLines: 4,
              ),
            ],
          ),
        ]);
  }

  Widget drawCircles(double height, Color color) {
    return Container(
      width: height,
      height: height,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
