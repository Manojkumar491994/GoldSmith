// ignore_for_file: prefer_const_constructors

import 'package:e_gold/Core/text.dart';
import 'package:flutter/material.dart';

class textForm extends StatelessWidget {
  final String label;
  final dynamic icon;
  final bool obscure;
  textForm({super.key, required this.label, this.icon, required this.obscure});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: txt.labeltext(),
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          label: Text(
            label,
            style: txt.labeltext(),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
