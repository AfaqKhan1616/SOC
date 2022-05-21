import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({Key? key,this.onTap,required this.icon,required this.text}) : super(key: key);

  final VoidCallback? onTap;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.black26),
            ),
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 16,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
