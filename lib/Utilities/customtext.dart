import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  final String text;
  final double? fs;
  final FontWeight? fw;
  final double? lp;
  final Color? clr;
  const Customtext({super.key, required this.text, this.fs, this.fw, this.lp, this.clr});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: clr,
        fontSize: fs,
        fontWeight: fw,
        letterSpacing: lp,
      ),
    );
  }
}
