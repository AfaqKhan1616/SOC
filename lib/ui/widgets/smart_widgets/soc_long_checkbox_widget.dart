import 'package:flutter/material.dart';

import 'package:soc/utils/theme.dart';

class SocLongCheckBox extends StatelessWidget {
  String? name;
  bool? isSelected = false;
  Function()? onSelected;

  SocLongCheckBox({
    Key? key,
    this.name = "",
    this.isSelected,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(children: [
        GestureDetector(
          onTap: () => onSelected!(),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: BoxDecoration(
                border: Border.all(color: MyTheme.lightGrey, width: 0.4),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text(
                  name ?? "",
                  style: TextStyle(fontSize: 15),
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    Container(
                      width: 50,
                    ),
                    isSelected == true
                        ? Container(
                            width: 18,
                            height: 18,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: MyTheme.mainColor, // border color
                              shape: BoxShape.rectangle,
                            ),
                          )
                        : Container(
                            width: 18,
                            height: 18,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: MyTheme.mainColor, width: 1),
                              // color: Colors.green.withOpacity(0.25), // border color
                              shape: BoxShape.rectangle,
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
