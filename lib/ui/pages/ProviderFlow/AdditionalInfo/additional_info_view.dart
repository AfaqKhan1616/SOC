import 'package:flutter/material.dart';
import 'package:soc/ui/pages/ProviderFlow/AdditionalInfo/additional_info_view_model.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_button.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_long_radio_button_widget.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_switch_box_widget.dart';
import 'package:soc/utils/size_config.dart';
import 'package:stacked/stacked.dart';

class AdditionalInfoView extends StatefulWidget {
  AdditionalInfoView({Key? key}) : super(key: key);

  @override
  State<AdditionalInfoView> createState() => _AdditionalInfoViewState();
}

class _AdditionalInfoViewState extends State<AdditionalInfoView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdditionalInfoViewModel>.reactive(
        viewModelBuilder: () => AdditionalInfoViewModel(),
        builder: (context, model, child) {
          SizeConfig().init(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizeBox(40),
                    headingText(),
                    sizeBox(25),
                    provideTransportationText(),
                    provideTransportationList(context, model),
                    sizeBox(10),
                    subsidizedCareText(),
                    subsidizedList(context, model),
                    sizeBox(10),
                    foodProgramText(),
                    foodProgramList(context, model),
                    sizeBox(10),
                    smokeFreeText(),
                    smokeFreeList(context, model),
                    Expanded(flex: 1, child: Container()),
                    button(context, model),
                    sizeBox(30),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget headingText() {
    return Text(
      "Additional info",
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget sizeBox(double height) {
    return SizedBox(
      height: getProportionateScreenHeight(height),
    );
  }

  Widget provideTransportationText() {
    return Text(
      "Do you provide transportation?*",
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }

  Widget provideTransportationList(
      BuildContext context, AdditionalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...model.transportationList
              .asMap()
              .entries
              .map((e) => SocLongRadioButton(
                    isSelected: e.value.isSelected,
                    typeName: e.value.text,
                    onSelectType: () {
                      model.onSelectTransporation(e.key);
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget subsidizedCareText() {
    return Text(
      "Do you accept subsidized care?*",
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }

  Widget subsidizedList(BuildContext context, AdditionalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...model.subsidizedList
              .asMap()
              .entries
              .map((e) => SocLongRadioButton(
                    isSelected: e.value.isSelected,
                    typeName: e.value.text,
                    onSelectType: () {
                      model.onSelectsubsidized(e.key);
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget foodProgramText() {
    return Text(
      "Are you on a food program?*",
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }

  Widget foodProgramList(BuildContext context, AdditionalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...model.foodProgramList
              .asMap()
              .entries
              .map((e) => SocLongRadioButton(
                    isSelected: e.value.isSelected,
                    typeName: e.value.text,
                    onSelectType: () {
                      model.onSelectfoodProgram(e.key);
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget smokeFreeText() {
    return Text(
      "Is your facility smoke free?*",
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }

  Widget smokeFreeList(BuildContext context, AdditionalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...model.smokeFreeList
              .asMap()
              .entries
              .map((e) => SocLongRadioButton(
                    isSelected: e.value.isSelected,
                    typeName: e.value.text,
                    onSelectType: () {
                      model.onSelectsmokeFree(e.key);
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget button(BuildContext context, AdditionalInfoViewModel model) {
    return SocButton(
      onPressed: () {
        model.onSubmit();
        // Navigator.pushNamed(context, Routes.home);
      },
      text: "Continue",
    );
  }
}
