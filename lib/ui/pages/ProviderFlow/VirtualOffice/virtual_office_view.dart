import 'package:flutter/material.dart';
import 'package:soc/utils/size_config.dart';
import 'package:stacked/stacked.dart';
import 'virtual_office_view_model.dart';

class VirtualOfficeView extends StatelessWidget {
  const VirtualOfficeView({Key? key}) : super(key: key);

  final optionLeftMargin = const EdgeInsets.fromLTRB(16, 8, 8, 8);
  final optionRightMargin = const EdgeInsets.fromLTRB(8, 8, 16, 8);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VirtualOfficeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildScreenTitle(),
              buildOptions(model),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => VirtualOfficeViewModel(),
    );
  }

  Widget buildScreenTitle() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16.0,16,16,8),
      child: Text(
        "Virtual Office",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget buildOptions(VirtualOfficeViewModel model) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: [
          option(
            title: "Requests",
            imageName: 'vo_calendar.png',
            margin: optionLeftMargin,
          ),
          option(
            title: "News/Info",
            imageName: 'vo_news.png',
            margin: optionRightMargin,
            onTap: model.onTapNews
          ),
          option(
            title: "Chat/Inbox",
            imageName: 'vo_chat.png',
            margin: optionLeftMargin,
          ),
          option(
            title: "Clients",
            imageName: 'vo_clients.png',
            margin: optionRightMargin,
          ),
          option(
            title: "Wallet",
            imageName: 'vo_wallet.png',
            margin: optionLeftMargin,
          ),
          option(
            title: "Pricing",
            imageName: 'vo_pricing.png',
            margin: optionRightMargin,
          ),
          option(
            title: "Employees",
            imageName: 'vo_employees.png',
            margin: optionLeftMargin,
          ),
          option(
            title: "Openings",
            imageName: 'vo_openings.png',
            margin: optionLeftMargin,
          ),
          option(
            title: "Social Wall",
            imageName: 'vo_social_wall.png',
            margin: optionLeftMargin,
          ),
        ],
      ),
    );
  }

  Widget option(
      {required String title, required String imageName, EdgeInsets? margin,VoidCallback? onTap}) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/$imageName',
                  height: getProportionateScreenHeight(100),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
