import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/Get/imagepicker.dart';
import 'package:get/get.dart';

class Editimageviewmodel {
  TextEditingController textcontroller = TextEditingController();
  TextEditingController creatortext = TextEditingController();
  Imagepickers imgpick = Get.put(Imagepickers());
  getxdialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Enter New Text",
            style: TextStyle(color: Colors.black),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: TextFormField(
            controller: textcontroller,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            maxLines: 3,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.remove,
                color: Colors.black,
              ),
              focusColor: Colors.black,
              hintText: "Enter your Text ... ",
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                imgpick.addtext(textcontroller.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                "Add Text",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      },
    );
  }
}
