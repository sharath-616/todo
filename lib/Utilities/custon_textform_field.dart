import 'package:flutter/material.dart';

class CustonTextformField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;

  const CustonTextformField(
      {super.key, this.hintText, this.labelText, this.controller, this.keyboardType, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.35),
          blurRadius: 15,
          spreadRadius: 0,
          offset: Offset(
            0,
            5,
          ),
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          keyboardType: keyboardType,
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            labelText: labelText,
          ),
        ),
      ),
    );
  }
}
