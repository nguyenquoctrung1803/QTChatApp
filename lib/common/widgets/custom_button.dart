import 'package:flutter/material.dart';
import 'package:flutter_chatapp/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: blackColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: tabColor,
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}
