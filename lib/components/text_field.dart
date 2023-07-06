import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String text;

  const TextFieldWidget(
      {Key? key, required this.controller, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(fontSize: 20),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
      ),
    );
  }
}
