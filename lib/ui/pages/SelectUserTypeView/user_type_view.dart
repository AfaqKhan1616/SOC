import 'package:flutter/material.dart';
import 'package:soc/ui/pages/SelectUserTypeView/user_type_view_model.dart';
import 'package:soc/utils/theme.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/size_config.dart';

class SelectUserTypeView extends StatelessWidget {
  const SelectUserTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashData = [
      {
        "index": "1",
        "textHeading": "I´m a provider",
        "image": "assets/images/provider_select.png",
      },
      {
        "index": "2",
        "textHeading": "I´m a client",
        "image": "assets/images/client_select.png"
      },
      {
        "index": "3",
        "textHeading": "I’m searching for a job",
        "image": "assets/images/job_select.png"
      },
    ];
    return ViewModelBuilder<UserTypeViewModel>.reactive(
        viewModelBuilder: () => UserTypeViewModel(),
        builder: (context, model, child) {
          SizeConfig().init(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingText(),
                  ...splashData
                      .asMap()
                      .entries
                      .map((e) => userType(splashData, e.key, model)),
                  Expanded(
                    flex: 5,
                    child: Container(
                        // color: MyTheme.lightBlue,
                        ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget headingText() {
    return Expanded(
      flex: 4,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Text(
            "Tell us who you are",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget userType(
      List<Map<String, String>> item, int key, UserTypeViewModel model) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: MyTheme.lineColor),
        ),
        height: getProportionateScreenHeight(90),
        width: getProportionateScreenWidth(350),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: () {
              if (key == 0) {
                model.onSelectProvide();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 7),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        item[key]['image']!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // height: getProportionateScreenHeight(80),
                  width: getProportionateScreenWidth(90),
                ),
                Text(
                  item[key]['textHeading']!,
                  style: TextStyle(fontSize: 17),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 17,
                  color: MyTheme.blackColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
