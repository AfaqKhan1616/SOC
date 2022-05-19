import 'package:soc/app/app.router.dart';
import 'package:soc/enums/auth_state.dart';

class StartupManager {
  Future<String> getNextRoute(AuthState authState) async {
    switch (authState) {
      case AuthState.NONE:
        return _onUserEmpty();
      case AuthState.LOGGED_IN:
        return _onUserLoggedIn();
      case AuthState.LOGOUT:
        return _onUserLogOut();
    }
  }

  Future<String> _onUserEmpty() async {
    return Routes.onBoardingView;
  }

  Future<String> _onUserLoggedIn() async {
    // final response = await apiService.decodeUserDatafromToken(
    //     token: UserPreferences.getUserToken()!);
    // if (response['userType'] == UserType.contractor.string()) {
    //   print(response['_id']);
    //   await profileService.getContractorUserData(contractorId: response['_id']);
    //   // profileService.contractorData = res;
    //   // print(res.businessName);
    // }
    // print("on user logged in function");

    return Routes.splashView;
  }

  Future<String> _onUserLogOut() async {
    return Routes.splashView;
  }
}
