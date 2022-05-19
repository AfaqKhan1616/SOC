import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class SignUpHeader extends StatelessWidget {
  final String? header;
  final String? normalText;
  final String? touchableText;
  final String? placeholder;
  final Function()? onPressed;
  const SignUpHeader({
    Key? key,
    this.header,
    this.normalText,
    this.touchableText,
    this.placeholder,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          header ?? "",
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
        ),
        const Padding(padding: EdgeInsets.only(top: 13)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(normalText ?? "",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight
                      .w400) //TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
          InkWell(
            child: Text(
              touchableText ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: MyTheme.links),
            ),
            onTap: onPressed,
          ),
        ]),
      ],
    );
  }
}
