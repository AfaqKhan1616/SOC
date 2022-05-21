import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet(
      {Key? key,
      this.onClose,
      required this.title,
      required this.child,
      this.loading = false})
      : super(key: key);

  final VoidCallback? onClose;
  final String title;
  final Widget child;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [header(), child],
      ),
    );
  }

  Container header() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MyTheme.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          sheetTitle(),
          closeButton(),
        ],
      ),
    );
  }

  Widget closeButton() {
    return loading
        ? const CircularProgressIndicator(
            color: MyTheme.green,
          )
        : TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                primary: Colors.white,
                padding: EdgeInsets.zero,
                maximumSize: const Size(40, 40),
                minimumSize: const Size(30, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: onClose,
            child: const Icon(
              Icons.close,
              color: Colors.black45,
            ),
          );
  }

  Text sheetTitle() {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
