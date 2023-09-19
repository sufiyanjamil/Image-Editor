import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/Widgets/getxdialog.dart';
import 'package:get/get.dart';
import '../Screens/2ndscreen.dart';

Editimageviewmodel edt = Editimageviewmodel();
Future<T?> showconfirmationdialog<T>(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Discard Edits",
          style: TextStyle(color: Colors.red),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Text(
          "Can you want to discard edits",
          style: TextStyle(color: Colors.black),
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
              Get.to(Secondscren());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              "Discard",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
    },
  );
}

getdraggable(context) {}
