import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../Get/filters.dart';

class Filter_screen extends StatelessWidget {
  Filter_screen({super.key, required this.image});
  File image;
  List<List<double>> post = [
    NoFilter,
    BLACKWHITE,
    GREY,
    SEPIA,
    EMBOSS,
    MILK,
    OLDTIMES,
    PURPLE,
    SWEET,
    VINTAGE,
  ];
  final _globalKey = GlobalKey();
  void convertimage() async {
    RenderRepaintBoundary renderrepaint = RenderRepaintBoundary();
    ui.Image boximage = await renderrepaint.toImage(pixelRatio: 1);
    ByteData? byte = await boximage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uni8list = byte!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Image Editor"),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RepaintBoundary(
              key: _globalKey,
              child: SizedBox(
                height: height * 0.70,
                width: width,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: post.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: size.height * 2 / 3,
                          width: double.infinity,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.matrix(post[index]),
                            child: Image.file(
                              image,
                              fit: BoxFit.cover,
                              width: size.width,
                              height: size.width,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(height: height * 0.14, width: width, child: buildcomp()),
          ],
        ),
      ),
    );
  }

  Widget buildcomp() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: post.length,
      itemBuilder: (context, index) {
        return ColorFiltered(
          colorFilter: ColorFilter.matrix(
            post[index],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(image),
            ),
          ),
        );
      },
    );
  }
}
