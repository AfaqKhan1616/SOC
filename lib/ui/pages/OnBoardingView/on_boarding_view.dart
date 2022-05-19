import 'package:flutter/material.dart';
import 'package:soc/ui/pages/OnBoardingView/components/SplashContent/splash_content_widget.dart';
import 'package:soc/ui/pages/OnBoardingView/on_boarding_view_model.dart';
import 'package:soc/utils/size_config.dart';
import 'package:soc/utils/theme.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/constants.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "index": "1",
      "textHeading": "Lorem ipsum",
      "textDescription":
          "Lorem ipsum dolor sit \n amet, consectetur\n adipiscing elit. Nisi,",
      "image": "assets/images/onBoarding1.png",
    },
    {
      "index": "2",
      "textHeading": "Lorem ipsum",
      "textDescription":
          "Lorem ipsum dolor sit \n amet, consectetur\n adipiscing elit. Nisi,",
      "image": "assets/images/onBoarding2.png"
    },
    {
      "index": "3",
      "textHeading": "Lorem ipsum",
      "textDescription":
          "Lorem ipsum dolor sit \n amet, consectetur\n adipiscing elit. Nisi,",
      "image": "assets/images/onBoarding3.png"
    },
  ];

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ViewModelBuilder<OnBoardingViewModel>.reactive(
        viewModelBuilder: () => OnBoardingViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => SplashContent(
                        image: splashData[index]["image"],
                        textDescription: splashData[index]['textDescription'],
                        textHeading: splashData[index]['textHeading'],
                        index: index,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index: index)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  model.onSkip();
                                },
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyTheme.mainColor),
                                ),
                              )),
                        ),
                      )),
                ],
              ),
            ),
          );
        });
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? MyTheme.mainColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
