import 'package:soc/app/app.router.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class ProfessionalInfoViewModel extends AppViewModel {
  onSubmit() {
    navigationService.navigateTo(Routes.additionalInfoView);
  }
}
