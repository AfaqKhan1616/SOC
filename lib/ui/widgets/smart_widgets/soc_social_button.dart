import 'package:flutter/material.dart';
import 'package:soc/utils/theme.dart';

class SocSocialButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final String imagePath;
  SocSocialButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<SocSocialButton> createState() => _SocSocialButtonState();
}

class _SocSocialButtonState extends State<SocSocialButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith(
            (states) => BorderSide(width: 0.5, color: MyTheme.lightGrey)),
        padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.symmetric(vertical: 12)),
        shape: MaterialStateProperty.resolveWith((states) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
      ),
      onPressed: widget.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          Image.asset(
            widget.imagePath,
            height: 30.0,
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
          Text(
            widget.text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
