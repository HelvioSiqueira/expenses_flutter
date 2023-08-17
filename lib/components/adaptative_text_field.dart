import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  const AdaptativeTextField(
      {Key? key,
      required this.label,
      required this.onSubmitted,
      required this.controller,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  final String label;
  final Function(String) onSubmitted;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              keyboardType: keyboardType,
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            keyboardType: keyboardType,
            decoration: InputDecoration(labelText: label),
            controller: controller,
            onSubmitted: onSubmitted,
          );
  }
}
