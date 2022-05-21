import 'package:flutter/material.dart';
import 'package:soc/ui/pages/ProviderFlow/FacilityInfo/facility_info_view_model.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_button.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_counter_widget.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_long_checkbox_widget.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_long_radio_button_widget.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_switch_box_widget.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_text_field.dart';
import 'package:soc/utils/size_config.dart';
import 'package:soc/utils/theme.dart';
import 'package:stacked/stacked.dart';

class FacilityInfoView extends StatefulWidget {
  FacilityInfoView({Key? key}) : super(key: key);

  @override
  State<FacilityInfoView> createState() => _FacilityInfoViewState();
}

class _FacilityInfoViewState extends State<FacilityInfoView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FacilityInfoViewModel>.reactive(
        viewModelBuilder: () => FacilityInfoViewModel(),
        builder: (context, model, child) {
          SizeConfig().init(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizeBox(20),
                      mainText(),
                      facilityNameField(context, model),
                      capacity(context, model),
                      openning(context, model),
                      agesText(context, model),
                      sizeBox(10),
                      selectAgeType(context, model),
                      hasCameraText(context, model),
                      hasCameraList(context, model),
                      daysText(),
                      selectOperationDays(context, model),
                      picturesOfFacilityText(),
                      uploadPictures(model),
                      amenitiesText(),
                      sizeBox(12),
                      selectAmenities(context, model),
                      otherField(context, model),
                      petText(),
                      sizeBox(12),
                      selectPets(context, model),
                      sizeBox(12),
                      button(context, model),
                      sizeBox(12),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget mainText() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20, top: 10),
      child: Text(
        "Facility info",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget sizeBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget facilityNameField(BuildContext context, FacilityInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
      child: SocTextField(
        labelText: "Facility name*",
        // validator: model.validateEmail,
        placeholder: "Introduce your facility name",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget capacity(BuildContext context, FacilityInfoViewModel model) {
    return SocCounter(
      title: "Capacity*",
    );
  }

  Widget openning(BuildContext context, FacilityInfoViewModel model) {
    return SocCounter(
      title: "Openings*",
    );
  }

  Widget agesText(BuildContext context, FacilityInfoViewModel model) {
    return const Text(
      "Which ages do you take care of?*",
      style: TextStyle(fontWeight: FontWeight.w700),
    );
  }

  Widget selectAgeType(BuildContext context, FacilityInfoViewModel model) {
    return Column(
      children: [
        ...model.ageTypes.asMap().entries.map((e) => SocLongCheckBox(
              name: e.value.name,
              isSelected: e.value.isSelected,
              onSelected: () {
                model.onSelectAge(e.key);
              },
            ))
      ],
    );
  }

  Widget hasCameraText(BuildContext context, FacilityInfoViewModel model) {
    return const Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        "Has cameras?*",
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget hasCameraList(BuildContext context, FacilityInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...model.hasCameras
              .asMap()
              .entries
              .map((e) => SocLongRadioButton(
                    isSelected: e.value.isSelected,
                    typeName: e.value.text,
                    onSelectType: () {
                      model.onSelectCameras(e.key);
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget daysText() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Days and hours of operation*",
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget selectOperationDays(
      BuildContext context, FacilityInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...model.activeDays
              .asMap()
              .entries
              .map((e) => dayWidget(e, model))
              .toList(),
        ],
      ),
    );
  }

  Widget dayWidget(MapEntry<int, AgeType> e, FacilityInfoViewModel model) {
    return Column(
      children: [
        SocSwitchCheckBox(
          isSelected: e.value.isSelected,
          name: e.value.name,
          onSelected: () {
            model.onSelectDays(e.key);
          },
        ),
        if (e.value.isSelected == true)
          Row(
            children: [
              Expanded(
                child: Center(
                  child: timeWidget(model, "From"),
                ),
              ),
              Expanded(
                child: Center(
                  child: timeWidget(model, "To"),
                ),
              ),
            ],
          ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget timeWidget(FacilityInfoViewModel model, String label) {
    return GestureDetector(
      onTap: () => model.pickTime(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  bottom: 2, // space between underline and text
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: MyTheme.hintGray, // Text colour here
                      width: 1.0, // Underline width
                    ),
                  ),
                ),
                child: const Text(
                  "00",
                  style: TextStyle(
                    fontSize: 20,
                    color: MyTheme.hintGray,
                  ),
                ),
              ),
              const Text(
                ": ",
                style: TextStyle(
                    color: MyTheme.hintGray,
                    decoration: TextDecoration.none,
                    fontSize: 14),
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 2, // space between underline and text
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: MyTheme.hintGray, // Text colour here
                      width: 1.0, // Underline width
                    ),
                  ),
                ),
                child: const Text(
                  "00",
                  style: TextStyle(
                    fontSize: 20,
                    color: MyTheme.hintGray,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget picturesOfFacilityText() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Pictures of the facility*",
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget uploadPictures(FacilityInfoViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: GestureDetector(
            onTap: model.pickImage,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    "assets/images/cloud_upload.png",
                    height: 36,
                    width: 36,
                  ),
                ),
                const Text("+ Photos"),
              ],
            ),
          ),
        ),
        if (model.images.isNotEmpty)
          SizedBox(
            height: 144,
            child: ListView.builder(
              itemCount: model.images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(index == 0 ? 0 : 8, 16,
                    index == model.images.length - 1 ? 0 : 8, 16),
                child: Container(
                  height: 118,
                  width: 118,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      model.images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget amenitiesText() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Amenities",
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget selectAmenities(BuildContext context, FacilityInfoViewModel model) {
    return Column(
      children: [
        ...model.amenities.asMap().entries.map((e) => SocLongCheckBox(
              name: e.value.name,
              isSelected: e.value.isSelected,
              onSelected: () {
                model.onSelectAmenities(e.key);
              },
            ))
      ],
    );
  }

  Widget otherField(BuildContext context, FacilityInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
      child: SocTextField(
        labelText: "Describe other",
        // validator: model.validateEmail,
        placeholder: "Type something",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget petText() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Do you have pets?*",
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget selectPets(BuildContext context, FacilityInfoViewModel model) {
    return Column(
      children: [
        ...model.havePets.asMap().entries.map((e) => SocLongCheckBox(
              name: e.value.text,
              isSelected: e.value.isSelected,
              onSelected: () {
                model.onSelectPet(e.key);
              },
            ))
      ],
    );
  }

  Widget button(BuildContext context, FacilityInfoViewModel model) {
    return SocButton(
      onPressed: () {
        model.onSubmit();
        // Navigator.pushNamed(context, Routes.home);
      },
      text: "Continue",
    );
  }
}
// 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
