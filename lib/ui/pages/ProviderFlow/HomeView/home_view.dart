import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("Home Page"),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
