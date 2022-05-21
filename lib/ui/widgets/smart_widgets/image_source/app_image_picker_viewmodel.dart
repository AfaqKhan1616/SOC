import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:stacked/stacked.dart';

class AppImagePickerViewModel extends BaseViewModel{

  late void Function(File? file) onImagePicked;

  void onModelReady(Function(File?) onImagePicked){
    this.onImagePicked = onImagePicked;
  }


  Future<void> pickImageFromSource(ImageSource source)async{
    final imageXFile =  await ImagePicker().pickImage(
      source: source,
    );
    if(imageXFile!=null){
      pop();
      onImagePicked(File(imageXFile.path));
    }
  }

  void pop(){
  }

}