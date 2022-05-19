import 'package:soc/app/app.router.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class PersonalInfoViewModel extends AppViewModel {
  onSubmit() {
    navigationService.navigateTo(Routes.facilityInfoView);
  }
}
