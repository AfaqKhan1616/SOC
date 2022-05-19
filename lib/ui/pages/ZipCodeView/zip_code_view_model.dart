import 'package:soc/app/app.router.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class ZipCodeViewModel extends AppViewModel {
  void onSubmit() {
    navigationService.navigateTo(Routes.selectUserTypeView);
  }
}
