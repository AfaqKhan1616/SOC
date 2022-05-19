import 'package:flutter/material.dart';
import 'package:soc/ui/pages/ProviderFlow/ProfessionalInfo/professional_info_view_model.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_button.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_long_text_field.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_text_field.dart';
import 'package:soc/utils/size_config.dart';
import 'package:stacked/stacked.dart';

class ProfessionalInfoView extends StatefulWidget {
  ProfessionalInfoView({Key? key}) : super(key: key);
  @override
  State<ProfessionalInfoView> createState() => _ProfessionalInfoViewState();
}

class _ProfessionalInfoViewState extends State<ProfessionalInfoView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfessionalInfoViewModel>.reactive(
        viewModelBuilder: () => ProfessionalInfoViewModel(),
        builder: (context, model, child) {
          SizeConfig().init(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizeBox(40),
                    headingText(),
                    yearsOfExperienceField(context, model),
                    sizeBox(10),
                    tellParentsField(context, model),
                    expanded(),
                    button(context, model),
                    sizeBox(30)
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget headingText() {
    return Text(
      "Professional info",
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget sizeBox(double height) {
    return SizedBox(
      height: getProportionateScreenHeight(height),
    );
  }

  Widget yearsOfExperienceField(
      BuildContext context, ProfessionalInfoViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(30)),
      child: SocTextField(
        labelText: "Years of Experience*",
        // validator: model.validateEmail,
        placeholder: "15 years",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget tellParentsField(
      BuildContext context, ProfessionalInfoViewModel model) {
    return SocLongTextField(
        initialValue: "",
        // validator: model.validateCompanyDescription,
        placeholder:
            "Type why a parent would like you or your facility to take care of their kids",
        labelText: "Tell the parents more about you",
        // errorText: model.companyDescriptionErrorText,
        onChangeText: (value) => {});
  }

  Widget expanded() {
    return Expanded(
      flex: 5,
      child: Container(
          // color: MyTheme.lightBlue,
          ),
    );
  }

  Widget button(BuildContext context, ProfessionalInfoViewModel model) {
    return SocButton(
      onPressed: () {
        model.onSubmit();
        // Navigator.pushNamed(context, Routes.home);
      },
      text: "Continue",
    );
  }
}
