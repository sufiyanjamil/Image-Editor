import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Screens/2ndscreen.dart';
import 'package:image_cropper/image_cropper.dart';
import '../models/textmodel.dart';

class Imagepickers extends GetxController {
  File? selectedImage;
  CroppedFile? croppedimage;
  Future<void> pickImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      Get.to(Secondscren());
    }
  }

  Future<void> pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      Get.to(Secondscren());
    }
  }

  Future<void> cropImage() async {
    final cropped = await ImageCropper().cropImage(
      sourcePath: selectedImage!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.black,
            backgroundColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (cropped != null) {
      selectedImage = File(cropped.path);
      update();
    }
  }

  List<TextInfo> texts = [];
  addtext(String txt) {
    texts.add(
      TextInfo(
        txt: txt,
        left: 0,
        top: 0,
        txtcolor: Colors.black,
        fontwght: FontWeight.normal,
        fontsize: 18,
        textAlign: TextAlign.center,
        fontStyle: FontStyle.italic,
      ),
    );
    update();
  }
}
