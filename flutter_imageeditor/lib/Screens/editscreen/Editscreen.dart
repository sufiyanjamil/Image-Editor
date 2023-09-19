import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/Get/opacitychange.dart';
import 'package:flutter_chatgpt/Widgets/alertdialog.dart';
import 'package:flutter_chatgpt/Widgets/getxdialog.dart';
import 'package:flutter_chatgpt/Widgets/menuiconwidget.dart';
import 'package:get/get.dart';

import '../../Get/imagepicker.dart';
import '../../Widgets/imagetext.dart';

// ignore: must_be_immutable
class Edit_scren extends StatelessWidget {
  Edit_scren({
    Key? key,
    required this.image,
  }) : super(key: key);
  final File image;
  Editimageviewmodel edt = Editimageviewmodel();
  @override
  Widget build(BuildContext context) {
    //Imagepickers imgpick = Get.put(Imagepickers());
    Opacitychnge controller = Get.put(Opacitychnge());
    return SafeArea(
      child: GetBuilder(
          init: Get.put(Imagepickers()),
          builder: (imgpick) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Obx(
                    () {
                      return Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                          color: Colors.white
                              .withOpacity(controller.brightnessValue.value),
                          colorBlendMode: BlendMode.softLight,
                        ),
                      );
                    },
                  ),
                  for (int i = 0; i < imgpick.texts.length; i++)
                    Positioned(
                      left: edt.imgpick.texts[i].left,
                      top: edt.imgpick.texts[i].top,
                      child: GestureDetector(
                        onTap: () {},
                        child: Draggable(
                          feedback: ImageText(
                            textinfo: edt.imgpick.texts[i],
                          ),
                          child: ImageText(
                            textinfo: edt.imgpick.texts[i],
                          ),
                          onDragEnd: (drag) {
                            final renderbox =
                                context.findRenderObject() as RenderBox;
                            Offset off = renderbox.globalToLocal(drag.offset);
                            edt.imgpick.texts[i].top = off.dy;
                            edt.imgpick.texts[i].left = off.dx;
                          },
                        ),
                      ),
                    ),
                  edt.creatortext.text.isNotEmpty
                      ? Positioned(
                          left: 0,
                          bottom: 0,
                          child: Text(
                            edt.creatortext.text,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.3)),
                          ),
                        )
                      : SizedBox.shrink(),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 0.10,
                    left: 10,
                    child: Menuiconwidget(
                        onTap: () {
                          showconfirmationdialog(context);
                        },
                        icon: Icons.arrow_back_outlined),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).padding.bottom + 20,
                    left: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Get.height / 2,
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Obx(
                                  () {
                                    return Slider(
                                      value: controller.brightnessValue.value,
                                      onChanged: (value) {
                                        controller.updateBrightness(value);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Menuiconwidget(onTap: () {}, icon: Icons.sunny),
                          ],
                        ),

                        // Menuiconwidget(onTap: () {}, icon: Icons.sunny),
                        SizedBox(
                          width: 10,
                        ),
                        Menuiconwidget(
                            onTap: () {
                              edt.getxdialog(context);
                            },
                            icon: Icons.text_fields_rounded),
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
