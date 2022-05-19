import 'package:flutter/material.dart';
import 'package:soc/ui/pages/OnBoardingView/on_boarding_view_model.dart';
import 'package:soc/ui/pages/SignUpView/signup_view_model.dart';
import 'package:soc/ui/widgets/dumb_widgets/signup_header.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_button.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_social_button.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_text_field.dart';
import 'package:soc/utils/size_config.dart';
import 'package:soc/utils/theme.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              body: SafeArea(
                  child: Form(
            key: formkey,
            child: ListView(
              children: [
                // Header(),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/signup.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: getProportionateScreenHeight(200),
                  width: getProportionateScreenWidth(250),
                ),
                SignUpHeader(
                  header: "Sign Up",
                  normalText: "If you have an account ",
                  touchableText: "Sign In",
                  onPressed: () => {},
                ),
                SizedBox(height: 55),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SocTextField(
                    labelText: "Full Name*",
                    validator: model.validateName,
                    placeholder: "Enter your full name",
                    onChanged: (value) => model.name = value!,
                    errorText: model.nameError,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SocTextField(
                    labelText: "Email*",
                    validator: model.validateEmail,
                    placeholder: "youremail@email.com",
                    onChanged: (value) => model.email = value!,
                    errorText: model.emailError,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SocTextField(
                    labelText: "Password*",
                    validator: model.validatePassword,
                    placeholder: "qwerty1234",
                    touchableIcon: true,
                    isPassword: true,
                    onChanged: (value) => model.password = value!,
                    errorText: model.passwordError,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: InkWell(
                //     child: Text(
                //       "I forgot my password",
                //       style: TextStyle(
                //           fontWeight: FontWeight.w700,
                //           fontSize: 14,
                //           color: MyTheme.links),
                //     ),
                //     onTap: () {},
                //   ),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "By creating the account I confirm that I have read and accepted the ",
                    style: TextStyle(fontSize: 9, color: MyTheme.lightGrey),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text(
                        "terms & conditions",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 9,
                            color: MyTheme.links),
                      ),
                      onTap: () {
                        print("object");
                      },
                    ),
                    Text(
                      " and",
                      style: TextStyle(
                        fontSize: 9,
                        color: MyTheme.lightGrey,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        " privacy policy.",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 9,
                            color: MyTheme.links),
                      ),
                      onTap: () {
                        print("object");
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SocButton(
                    onPressed: () {
                      model.onSubmit();
                      // Navigator.pushNamed(context, Routes.home);
                    },
                    text: "Continue",
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(color: MyTheme.lightGrey)),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                    ),
                    Text('OR'),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                    ),
                    Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: MyTheme.lightGrey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SocSocialButton(
                        imagePath: "assets/images/google.png",
                        onPressed: () {},
                        text: "Sign in with Google")),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SocSocialButton(
                        imagePath: "assets/images/facebook.png",
                        onPressed: () {},
                        text: "Sign in with Facebook")),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SocSocialButton(
                        imagePath: "assets/images/apple-logo.png",
                        onPressed: () {},
                        text: "Sign in with Apple")),
                const SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(
                      "Need Help? Contact Us",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: MyTheme.links),
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )));
        });
  }
}
