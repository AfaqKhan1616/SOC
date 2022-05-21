import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import '../../dumb_widgets/app_bottom_sheet.dart';
import '../../dumb_widgets/bottom_sheet_button.dart';
import 'app_image_picker_viewmodel.dart';

class ImagePickerView extends StatelessWidget {
  const ImagePickerView({Key? key,required this.onImagePicked}) : super(key: key);
  final Function(File?) onImagePicked;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppImagePickerViewModel>.reactive(
      onModelReady: (m) => m.onModelReady(onImagePicked),
      viewModelBuilder: () => AppImagePickerViewModel(),
      builder: (context, model, _) => AppBottomSheet(
        title: "Choose an Option",
        onClose: model.pop,
        child: Column(
          children: [
            BottomSheetButton(
              icon: const Icon(Icons.camera),
              text: "Camera",
              onTap: () => model.pickImageFromSource(ImageSource.camera),
            ),
            BottomSheetButton(
              icon: const Icon(Icons.image),
              text: "Gallery",
              onTap: () => model.pickImageFromSource(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }
}
