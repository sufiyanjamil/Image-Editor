import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/Get/imagepicker.dart';
import 'package:flutter_chatgpt/Widgets/elevatedbtn.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Imagepickers img = Get.put(Imagepickers());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Image Editor"),
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Elevatedbtn(
                      onTap: () {
                        img.pickImageFromCamera();
                      },
                      txt: "Choose image from camera")),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Elevatedbtn(
                      onTap: () {
                        img.pickImageFromGallery();
                      },
                      txt: "Choose image from Gallery")),
            ],
          )),
    );
  }
}
