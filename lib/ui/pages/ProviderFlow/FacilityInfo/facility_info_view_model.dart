import 'dart:io';

import 'package:flutter/material.dart';
import 'package:soc/app/app.locator.dart';
import 'package:soc/app/app.router.dart';
import 'package:soc/app/register_compact_ui.dart';
import 'package:soc/models/radio_button_model.dart';
import 'package:soc/ui/pages/app_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class FacilityInfoViewModel extends AppViewModel {
  List<File> images = List.empty(growable: true);

  List<AgeType> ageTypes = [
    AgeType(name: "All ages (0-12)", isSelected: false),
    AgeType(name: "Infants", isSelected: false),
    AgeType(name: "Toddlers", isSelected: false),
    AgeType(name: "School age", isSelected: false)
  ];
  List<AgeType> activeDays = [
    AgeType(name: "All week", isSelected: false),
    AgeType(name: "Monday", isSelected: false),
    AgeType(name: "Tuesday", isSelected: false),
    AgeType(name: "Wednesday", isSelected: false),
    AgeType(name: "Thursday", isSelected: false),
    AgeType(name: "Friday", isSelected: false),
    AgeType(name: "Saturday", isSelected: false),
    AgeType(name: "Sunday", isSelected: false),
  ];
  List<AgeType> amenities = [
    AgeType(name: "Tutoring", isSelected: false),
    AgeType(name: "Meals", isSelected: false),
    AgeType(name: "Nightcare", isSelected: false),
    AgeType(name: "Virtual learning", isSelected: false),
    AgeType(name: "Foreign language", isSelected: false),
    AgeType(name: "Potty training", isSelected: false),
    AgeType(name: "Field trips", isSelected: false),
    AgeType(name: "Other", isSelected: false),
  ];
  List<RadioButtonModel> hasCameras = [
    RadioButtonModel(text: "Yes", isSelected: false),
    RadioButtonModel(text: "No", isSelected: false)
  ];

  List<RadioButtonModel> havePets = [
    RadioButtonModel(text: "No, no pets", isSelected: false),
    RadioButtonModel(text: "Dog/s", isSelected: false),
    RadioButtonModel(text: "Cat/s", isSelected: false),
    RadioButtonModel(text: "Other/s", isSelected: false)
  ];

  onSelectAge(int index) {
    ageTypes[index].isSelected = !ageTypes[index].isSelected!;
    notifyListeners();
  }

  onSelectDays(int index) {
    activeDays[index].isSelected = !activeDays[index].isSelected!;
    notifyListeners();
  }

  onSelectAmenities(int index) {
    amenities[index].isSelected = !amenities[index].isSelected!;
    notifyListeners();
  }

  onSelectCameras(int index) {
    hasCameras.forEach((element) {
      element.isSelected = false;
    });
    hasCameras[index].isSelected = true;
    notifyListeners();
  }

  onSelectPet(int index) {
    havePets.forEach((element) {
      element.isSelected = false;
    });
    havePets[index].isSelected = true;
    notifyListeners();
  }

  onSubmit() {
    navigationService.navigateTo(Routes.professionalInfoView);
  }

  pickTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 00, minute: 00),
    );
  }

  pickImage() {
    final bottomSheetService = locator<BottomSheetService>();
    bottomSheetService.showCustomSheet(
      variant: BottomSheetType.imageSource,
      data: AppImagePickerViewArguments((image) {
        if (image != null) images.add(image);
        navigationService.back();
        notifyListeners();
      }),
    );
  }
}

class AgeType {
  String? name;
  bool? isSelected;

  AgeType({
    this.name,
    this.isSelected,
  });
}
