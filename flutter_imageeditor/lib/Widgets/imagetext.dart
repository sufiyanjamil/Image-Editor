import 'package:flutter/material.dart';

import '../models/textmodel.dart';
import '../models/textmodel.dart';

class ImageText extends StatelessWidget {
  final TextInfo textinfo;
  const ImageText({
    Key? key,
    required this.textinfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textinfo.txt,
      textAlign: textinfo.textAlign,
      style: TextStyle(
        fontWeight: textinfo.fontwght,
        fontSize: textinfo.fontsize,
        fontStyle: textinfo.fontStyle,
        color: textinfo.txtcolor,
      ),
    );
  }
}
