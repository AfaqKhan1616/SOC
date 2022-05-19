import 'package:flutter/material.dart';
import 'package:soc/ui/pages/ProviderFlow/PricingAndPayment/pricing_payment_view_model.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_button.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_long_radio_button_widget.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_text_field.dart';
import 'package:soc/utils/size_config.dart';
import 'package:stacked/stacked.dart';

class PricingPaymentView extends StatefulWidget {
  PricingPaymentView({Key? key}) : super(key: key);

  @override
  State<PricingPaymentView> createState() => _PricingPaymentViewState();
}

class _PricingPaymentViewState extends State<PricingPaymentView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PricingPaymentViewModel>.reactive(
        viewModelBuilder: () => PricingPaymentViewModel(),
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
                      sizeBox(10),
                      mainText(),
                      subHeading(),
                      selectMontlyWeekly(context, model),
                      infantField(context, model),
                      toddlersField(context, model),
                      schoolAgeField(context, model),
                      bankText(),
                      accountHolderNameField(context, model),
                      accountNumberField(context, model),
                      routingField(context, model),
                      bankNameField(context, model),
                      accountTypeText(),
                      selectAccountType(context, model),
                      invoiceText(),
                      taxField(context, model),
                      sizeBox(15),
                      button(context, model),
                      sizeBox(10),
                    ],
                  ),
                ]),
              ),
            ),
          );
        });
  }

  Widget mainText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 10),
      child: Text(
        "Pricing  and payment",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget sizeBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget subHeading() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Text(
        "Introduce your weekly pricing according to age",
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget selectMontlyWeekly(
      BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...model.monthlyWeekly
              .asMap()
              .entries
              .map((e) => SocLongRadioButton(
                    isSelected: e.value.isSelected,
                    typeName: e.value.text,
                    onSelectType: () {
                      model.onSelectWeeklyMonthly(e.key);
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget infantField(BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Infant",
        // validator: model.validateEmail,
        placeholder: "\$0000",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget toddlersField(BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Toddlers",
        // validator: model.validateEmail,
        placeholder: "\$0000",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget schoolAgeField(BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "School age",
        // validator: model.validateEmail,
        placeholder: "\$0000",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget bankText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 10),
      child: Text(
        "Bank info",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget accountHolderNameField(
      BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Account holder name*",
        // validator: model.validateEmail,
        placeholder: "Type here",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget accountNumberField(
      BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Account number*",
        // validator: model.validateEmail,
        placeholder: "Enter your account number",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget routingField(BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Routing number*",
        // validator: model.validateEmail,
        placeholder: "Type here",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget bankNameField(BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Bank name*",
        // validator: model.validateEmail,
        placeholder: "Enter your bank name",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget accountTypeText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Text(
        "Account type",
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget selectAccountType(
      BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...model.accountType
              .asMap()
              .entries
              .map((e) => SocLongRadioButton(
                    isSelected: e.value.isSelected,
                    typeName: e.value.text,
                    onSelectType: () {
                      model.onSelectAccountType(e.key);
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget invoiceText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 10),
      child: Text(
        "Invoicing information",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget taxField(BuildContext context, PricingPaymentViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: SocTextField(
        labelText: "Tax ID number/EIN",
        // validator: model.validateEmail,
        placeholder: "Type heres",
        // onChanged: (value) => model.email = value!,
        // errorText: model.emailError,
      ),
    );
  }

  Widget button(BuildContext context, PricingPaymentViewModel model) {
    return SocButton(
      onPressed: () {
        model.onSubmit();
        // Navigator.pushNamed(context, Routes.home);
      },
      text: "Continue",
    );
  }
}
