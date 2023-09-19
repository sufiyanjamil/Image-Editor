import 'package:flutter/material.dart';

class Menuiconwidget extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  Menuiconwidget({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: 54,
        decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.6), shape: BoxShape.circle),
        child: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
