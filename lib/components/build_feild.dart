import 'package:flutter/material.dart';

class MyFeild extends StatelessWidget {
  const MyFeild(
      {super.key,
      required this.controller,
      required this.title,
      required this.titlecolor,
      this.icon,
      required this.focus,
      this.validation,
      this.onSaved});

  final TextEditingController controller;

  final String title;
  final Color titlecolor;
  final Icon? icon;
  final dynamic validation;
  final bool focus;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: titlecolor))),
        TextFormField(
          autofocus: focus,
          controller: controller,
          validator: validation,
          onSaved: onSaved,
          decoration: InputDecoration(
              prefixIcon: icon,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 5),
              ),
              hintText: "Enter Your $title",
              hintStyle: TextStyle(color: Theme.of(context).primaryColorDark)),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
