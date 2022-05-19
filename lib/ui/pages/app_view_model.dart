import 'package:soc/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppViewModel extends BaseViewModel with _ServiceMixin {}

mixin _ServiceMixin {
  // final dialogService = locator<DialogService>();
  final navigationService = locator<NavigationService>();
  // final snackBarService = locator<SnackbarService>();
}
