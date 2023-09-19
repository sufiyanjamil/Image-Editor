import 'package:flutter/material.dart';

class Elevatedbtn extends StatelessWidget {
  final VoidCallback onTap;
  final String txt;
  Elevatedbtn({
    Key? key,
    required this.onTap,
    required this.txt,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        fixedSize: Size(250, 50),
      ),
      child: Text(
        txt,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
