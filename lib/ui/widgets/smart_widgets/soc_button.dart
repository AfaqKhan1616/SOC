import 'package:flutter/material.dart';
import 'package:soc/utils/theme.dart';

class SocButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool iconVisible;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final bool? disable;
  final bool? leftIcon;
  final bool? uploadIcon;
  SocButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.iconVisible = false,
      this.textColor,
      this.borderColor,
      this.backgroundColor,
      this.disable = false,
      this.leftIcon = false,
      this.uploadIcon = false})
      : super(key: key);

  @override
  State<SocButton> createState() => _SocButtonState();
}

class _SocButtonState extends State<SocButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith((states) => BorderSide(
            width: 0.5,
            color: widget.disable == true
                ? MyTheme.lightGrey
                : widget.borderColor ?? MyTheme.mainColor)),
        padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.symmetric(vertical: 16)),
        shape: MaterialStateProperty.resolveWith((states) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        backgroundColor: MaterialStateProperty.resolveWith((states) =>
            widget.disable == true
                ? MyTheme.lightGrey
                : widget.backgroundColor ?? MyTheme.mainColor),
      ),
      onPressed: widget.disable == true ? null : widget.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.leftIcon == true
              ? Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.add,
                    color: MyTheme.mainColorLight,
                  ),
                )
              : Container(),
          widget.uploadIcon == true
              ? Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.arrow_upward,
                    color: MyTheme.mainColorLight,
                  ),
                )
              : Container(),
          Text(
            widget.text,
            style: TextStyle(
                color: widget.textColor ?? Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          Container(
            child: widget.iconVisible == true
                ? Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                : null,
          )
        ],
      ),
    );
  }
}
