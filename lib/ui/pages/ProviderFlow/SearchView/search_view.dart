import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_view_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) => const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("Home Page"),
          ),
        ),
      ),
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}
