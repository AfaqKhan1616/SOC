import 'package:flutter/material.dart';

import 'package:soc/utils/theme.dart';

class SocCounter extends StatefulWidget {
  String? title = "";
  int? count = 0;
  Function()? onDecrement;
  Function()? onIncrement;
  SocCounter({
    Key? key,
    this.title,
    this.count = 0,
    this.onDecrement,
    this.onIncrement,
  }) : super(key: key);

  @override
  State<SocCounter> createState() => _SocCounterState();
}

class _SocCounterState extends State<SocCounter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              widget.title!,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                border: Border.all(color: MyTheme.lightGrey, width: 0.4),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text(
                  widget.count.toString(),
                  style: TextStyle(fontSize: 15),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // model.onIncrement();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/upArrow.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: MediaQuery.of(context).size.width * 0.03,
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // model.onDecrement();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/down_Arrow.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: MediaQuery.of(context).size.width * 0.03,
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
