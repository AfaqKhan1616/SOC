import 'package:soc/app/app.router.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class SignUpViewModel extends AppViewModel {
  String? nameError;
  String? emailError;
  String? passwordError;
  String? zipError;
  String? licenseNoError;

  String name = "";
  String email = "";
  String password = "";
  String zip = "";
  String licenseNo = '';

  String myValue = "";
  String? myValueError;
  bool passwordVisible = true;


  void validateMyValue(String? value) {
    if (value == null || value.isEmpty) {
      myValueError = "Full Name is required";
    } else {
      myValueError = null;
    }
    notifyListeners();
  }

  void validateName(String? value) {
    if (value == null || value.isEmpty) {
      nameError = "Full Name is required";
    } else {
      nameError = null;
    }
    notifyListeners();
  }
  void validateLicenseNo(String? value) {
    if (value == null || value.isEmpty) {
      licenseNoError = "License No is required";
    } else {
      licenseNoError = null;
    }
    notifyListeners();
  }

  void validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      emailError = "Email is required";
    } else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      if (emailValid) {
        emailError = null;
      } else {
        emailError = "Email is invalid";
      }
    }
    notifyListeners();
  }

  void validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordError = "Password is required";
    } else {
      passwordError = null;
    }
    notifyListeners();
  }

  void validateZip(String? value) {
    if (value == null || value.isEmpty) {
      zipError = "Zip is required";
    } else {
      zipError = null;
    }
    notifyListeners();
  }

  void gotoSignUp() {
    // navigationService.navigateTo(Routes.selectRole);
  }

  void onSubmit() async {
    navigationService.navigateTo(Routes.tabsView);
    // if (checkValid()) {
    //   showLoadingDialog();
    //   try {
    //     final response =
    //         await authService.signIn(email: email, password: password);
    //     profileService.userModel = response;
    //     UserPreferences.setUserId(response.id);
    //     final nextView = await StartupManager().getNextRoute(authService.state);
    //     navigationService.clearStackAndShow(nextView);
    //   } on ApiException catch (e) {
    //     navigationService.back();
    //     snackBarService.showCustomSnackBar(
    //       message: e.message,
    //       variant: SnackbarType.normal,
    //     );
    //   } catch (e) {
    //     navigationService.back();
    //     snackBarService.showCustomSnackBar(
    //       message: e.toString(),
    //       variant: SnackbarType.normal,
    //     );
    //   }
    // } else {
    //   snackBarService.showCustomSnackBar(
    //     message: "Please provide all the required parameters",
    //     variant: SnackbarType.normal,
    //   );
    // }
    // authService.signIn()
  }

  showLoadingDialog() {
    // dialogService.showCustomDialog(variant: DialogType.loading);
  }

  bool checkValid() {
    return (emailError == null &&
        email.isNotEmpty &&
        passwordError == null &&
        password.isNotEmpty);
  }
}
