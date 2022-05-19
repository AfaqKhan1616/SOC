import 'package:soc/app/app.router.dart';
import 'package:soc/ui/pages/app_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends AppViewModel {
  void onModelReady() async {
    // final nextView = await StartupManager().getNextRoute(authService.state);
    Future.delayed(Duration(seconds: 2), () {
      navigationService.clearStackAndShow(Routes.onBoardingView);
    });
  }
}
