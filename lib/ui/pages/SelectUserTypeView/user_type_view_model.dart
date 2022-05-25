import 'package:soc/app/app.router.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class UserTypeViewModel extends AppViewModel {
  onSelectProvide() {
    navigationService.navigateTo(
      Routes.signUpView,
      arguments: SignUpViewArguments(showLicenceNoField: true),
    );
  }
}
