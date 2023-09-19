import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/Screens/editscreen/Editscreen.dart';
import 'package:get/get.dart';
import '../Get/imagepicker.dart';
import 'filters/filterscreen.dart';

class Secondscren extends StatelessWidget {
  Secondscren({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Imagepickers img = Get.put(Imagepickers());
    return SafeArea(
      child: GetBuilder<Imagepickers>(
          init: Get.put(Imagepickers()),
          builder: (img) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("Second Screen"),
                elevation: 0.0,
                centerTitle: true,
                backgroundColor: Colors.black,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: Get.height * 0.600,
                      width: double.infinity,
                      child: Image.file(
                        img.selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 92,
                    width: double.infinity,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            img.cropImage();
                          },
                          icon: Icon(
                            Icons.crop,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(Filter_screen(
                              image: img.selectedImage as File,
                            ));
                          },
                          icon: Icon(
                            Icons.filter_2,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(
                                Edit_scren(image: img.selectedImage as File));
                          },
                          icon: Icon(
                            Icons.edit_note_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
