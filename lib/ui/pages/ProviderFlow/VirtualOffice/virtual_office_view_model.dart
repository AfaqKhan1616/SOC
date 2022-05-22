import 'package:soc/app/app.router.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class VirtualOfficeViewModel extends AppViewModel {
  void onTapNews() {
    navigationService.navigateTo(Routes.newsInfoView);
  }

}
