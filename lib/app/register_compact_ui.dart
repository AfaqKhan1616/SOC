
import 'dart:io';

import 'package:soc/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/widgets/smart_widgets/ImageSource/app_image_picker_view.dart';

enum BottomSheetType { imageSource }

void registCompactUI(){
  final bottomSheet = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.imageSource: (context, SheetRequest req, res) {
      final args = req.data as AppImagePickerViewArguments;
      return ImagePickerView(onImagePicked: args.onImagePicked);
    }
  };

  bottomSheet.setCustomSheetBuilders(builders);
}

class AppImagePickerViewArguments {
  final Function(File?) onImagePicked;

  AppImagePickerViewArguments(this.onImagePicked);
}
