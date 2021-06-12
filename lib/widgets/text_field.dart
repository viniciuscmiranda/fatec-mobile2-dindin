import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.icon,
    this.hint,
    this.callback,
    this.controller,
    this.enabled = false,
  });

  final IconData icon;
  final String hint;
  final Function callback;
  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        enabled: enabled,
        controller: controller,
        onChanged: callback,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Colors.white60,
          labelText: hint,
          labelStyle: TextStyle(color: Colors.amberAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amberAccent),
            borderRadius: BorderRadius.circular(32),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}
