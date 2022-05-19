import 'package:flutter/material.dart';
import 'package:soc/ui/pages/ProviderFlow/PersonalInfo/personal_into_view_model.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_button.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_long_text_field.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_text_field.dart';
import 'package:soc/utils/size_config.dart';
import 'package:soc/utils/theme.dart';
import 'package:stacked/stacked.dart';

class PersonalIntoView extends StatefulWidget {
  PersonalIntoView({Key? key}) : super(key: key);

  @override
  State<PersonalIntoView> createState() => _PersonalIntoViewState();
}

class _PersonalIntoViewState extends State<PersonalIntoView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonalInfoViewModel>.reactive(
        viewModelBuilder: () => PersonalInfoViewModel(),
        builder: (context, model, child) {
          SizeConfig().init(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizeBox(20),
                      profileInfo(),
                      mainText(),
                      addressField(context, model),
                      cityField(context, model),
                      stateField(context, model),
                      zipCodeField(context, model),
                      buildingNameField(context, model),
                      phoneNumberField(context, model),
                      additionalDetailsField(context, model),
                      sizeBox(20),
                      button(context, model),
                      sizeBox(20),
                    ],
                  ),
                ]),
              ),
            ),
          );
        });
  }

  Widget profileInfo() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Stack(alignment: Alignment.topRight, children: [
        Container(
          height: 120,
          width: 120,
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: MyTheme.mainColor),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        InkWell(
          child: Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(top: 15, left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: MyTheme.mainColor),
            child: Center(
                child: Icon(Icons.edit, size: 20, color: MyTheme.whiteColor)),
          ),
        ),
      ]),
    ]);
  }

  Widget mainText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: Text(
        "Personal info",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget sizeBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget addressField(BuildContext context, PersonalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
      child: SocTextField(
        labelText: "Address line 1*",
        // validator: model.validateEmail,
        placeholder: "Type your address",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget cityField(BuildContext context, PersonalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "City*",
        // validator: model.validateEmail,
        placeholder: "Type here",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget stateField(BuildContext context, PersonalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "State*",
        // validator: model.validateEmail,
        placeholder: "Type here",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget zipCodeField(BuildContext context, PersonalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Zip code*",
        // validator: model.validateEmail,
        placeholder: "Type here",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget buildingNameField(BuildContext context, PersonalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Apartment/building name* ",
        // validator: model.validateEmail,
        placeholder: "Type here",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget phoneNumberField(BuildContext context, PersonalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Phone number*",
        // validator: model.validateEmail,
        placeholder: "Type here",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget additionalDetailsField(
      BuildContext context, PersonalInfoViewModel model) {
    return Padding(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        child: SocLongTextField(
            initialValue: "",
            // validator: model.validateCompanyDescription,
            placeholder:
                "Enter any relevant additional detail about your address",
            labelText: "Additional details",
            // errorText: model.companyDescriptionErrorText,
            onChangeText: (value) => {}));
  }

  Widget button(BuildContext context, PersonalInfoViewModel model) {
    return SocButton(
      onPressed: () {
        model.onSubmit();
        // Navigator.pushNamed(context, Routes.home);
      },
      text: "Continue",
    );
  }
}
