import 'package:soc/app/app.router.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class RequestPendingViewModel extends AppViewModel {
  void onModelReady() async {
    Future.delayed(const Duration(seconds: 2), () {
      navigationService.navigateTo(Routes.virtualOfficeView);
    });
  }
}
