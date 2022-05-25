import 'package:flutter/material.dart';
import 'package:soc/ui/pages/ProviderFlow/HomeView/home_view.dart';
import 'package:soc/ui/pages/ProviderFlow/PersonalInfo/personal_info_view.dart';
import 'package:soc/ui/pages/ProviderFlow/SearchView/search_view.dart';
import 'package:soc/ui/pages/ProviderFlow/VirtualOffice/virtual_office_view.dart';
import 'package:stacked/stacked.dart';

import 'tabs_view_model.dart';

class TabsView extends StatelessWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TabsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body:SafeArea(
          child: PageView(
            children:const  [
              HomeView(),
              SearchView(),
              VirtualOfficeView(),
              PersonalIntoView(),
            ],
          ),
        )
      ),
      viewModelBuilder: () => TabsViewModel(),
    );
  }
}
