import 'package:soc/app/app.router.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class OnBoardingViewModel extends AppViewModel {
  onSkip() {
    navigationService.navigateTo(Routes.selectUserTypeView);
  }
}
