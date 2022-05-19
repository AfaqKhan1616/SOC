import 'package:flutter/material.dart';
import 'package:soc/utils/theme.dart';

class SocLongRadioButton extends StatefulWidget {
  String? typeName;
  bool? isSelected = false;
  double price;
  bool showPrice;
  bool? minusSign;
  bool? isPercentage;
  Function()? onSelectType;
  SocLongRadioButton(
      {Key? key,
      this.typeName,
      this.isSelected,
      this.onSelectType,
      this.minusSign = false,
      this.showPrice = false,
      this.isPercentage = false,
      this.price = -1})
      : super(key: key);

  @override
  State<SocLongRadioButton> createState() => _SocLongRadioButtonState();
}

class _SocLongRadioButtonState extends State<SocLongRadioButton> {
  String get formattedPrice {
    if (widget.isPercentage == true) {
      return "${double.parse(widget.price.toStringAsFixed(1))}%";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => widget.onSelectType!(),
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.42,
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
                  widget.typeName ?? "",
                  style: TextStyle(fontSize: 15),
                ),
                Expanded(child: Container()),
                widget.price >= 0
                    ? Text(
                        "${widget.minusSign == true ? "-" : "+"} $formattedPrice ")
                    : Container(),
                Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(left: 15),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyTheme.mainColor, width: 1),
                    // color: Colors.green.withOpacity(0.25), // border color
                    shape: BoxShape.circle,
                  ),
                  child: widget.isSelected == true
                      ? Container(
                          decoration: BoxDecoration(
                              color: MyTheme.mainColor, shape: BoxShape.circle),
                        )
                      : null,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
