import 'package:flutter/material.dart';

class Elevatedbutton extends StatelessWidget {
  late final String text;
  final VoidCallback? onPressed;

  Elevatedbutton({super.key, required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 191, 219, 247),
      ),
      child: Text(text, style: TextStyle(fontSize: 20, color: Colors.black)),
    );
  }
}
