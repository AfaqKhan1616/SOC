import 'package:soc/app/app.router.dart';
import 'package:soc/models/radio_button_model.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class PricingPaymentViewModel extends AppViewModel {
  List<RadioButtonModel> monthlyWeekly = [
    RadioButtonModel(text: "Monthly", isSelected: false),
    RadioButtonModel(text: "Weekly", isSelected: false)
  ];
  List<RadioButtonModel> accountType = [
    RadioButtonModel(text: "Checking", isSelected: false),
    RadioButtonModel(text: "Savings", isSelected: false)
  ];

  onSelectWeeklyMonthly(int index) {
    monthlyWeekly.forEach((element) {
      element.isSelected = false;
    });
    monthlyWeekly[index].isSelected = true;

    notifyListeners();
  }

  onSelectAccountType(int index) {
    accountType.forEach((element) {
      element.isSelected = false;
    });
    accountType[index].isSelected = true;
    notifyListeners();
  }

  onSubmit() {
    navigationService.navigateTo(Routes.requestPending);
  }
}
