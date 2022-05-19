import 'package:flutter/material.dart';
import 'package:soc/utils/theme.dart';

class RequestPending extends StatelessWidget {
  const RequestPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.access_time_filled_rounded,
                  size: 65, color: MyTheme.mainColor),
              SizedBox(
                height: 20,
              ),
              Text(
                "We got you, we´ll get \n   back to you soon !",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "   Your request is being reviwed,\nsomeone will get in touch with you.")
            ],
          )),
        ),
      ),
    );
  }
}
