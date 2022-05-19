import 'package:soc/app/app.router.dart';
import 'package:soc/models/radio_button_model.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class AdditionalInfoViewModel extends AppViewModel {
  List<RadioButtonModel> transportationList = [
    RadioButtonModel(text: "Yes", isSelected: false),
    RadioButtonModel(text: "No", isSelected: false)
  ];
  List<RadioButtonModel> subsidizedList = [
    RadioButtonModel(text: "Yes", isSelected: false),
    RadioButtonModel(text: "No", isSelected: false)
  ];
  List<RadioButtonModel> foodProgramList = [
    RadioButtonModel(text: "Yes", isSelected: false),
    RadioButtonModel(text: "No", isSelected: false)
  ];
  List<RadioButtonModel> smokeFreeList = [
    RadioButtonModel(text: "Yes", isSelected: false),
    RadioButtonModel(text: "No", isSelected: false)
  ];
  onSelectTransporation(int index) {
    transportationList.forEach((element) {
      element.isSelected = false;
    });
    transportationList[index].isSelected = true;

    notifyListeners();
  }

  onSelectsubsidized(int index) {
    subsidizedList.forEach((element) {
      element.isSelected = false;
    });
    subsidizedList[index].isSelected = true;
    notifyListeners();
  }

  onSelectfoodProgram(int index) {
    foodProgramList.forEach((element) {
      element.isSelected = false;
    });
    foodProgramList[index].isSelected = true;
    notifyListeners();
  }

  onSelectsmokeFree(int index) {
    smokeFreeList.forEach((element) {
      element.isSelected = false;
    });
    smokeFreeList[index].isSelected = true;
    notifyListeners();
  }

  onSubmit() {
    navigationService.navigateTo(Routes.pricingPaymentView);
  }
}
