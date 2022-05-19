import 'package:flutter/material.dart';

import 'package:soc/utils/theme.dart';

class SocSwitchCheckBox extends StatelessWidget {
  String? name;
  bool? isSelected = false;
  // Function()? onSelected;
  final VoidCallback? onSelected;

  SocSwitchCheckBox({
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
          onTap: () {},
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
                    Switch(
                      onChanged: (value) => {onSelected!()},
                      value: isSelected!,
                      activeColor: MyTheme.mainColor,
                      activeTrackColor: Color.fromARGB(255, 180, 236, 166),
                      inactiveThumbColor: Color.fromARGB(255, 75, 75, 75),
                      inactiveTrackColor: Color.fromARGB(255, 173, 172, 171),
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
