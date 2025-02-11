import 'package:flutter/cupertino.dart';
import 'package:news/style/appcolors.dart';

class CustomOverflowText extends StatelessWidget {
  final String text;
  final int maxLength;

  CustomOverflowText({required this.text, this.maxLength = 150}); // Adjust length as needed

  @override
  Widget build(BuildContext context) {
    String displayedText = text;
    if (text.length > maxLength) {
      displayedText = text.substring(0, maxLength) + " [+${text.length - maxLength} chars]";
    }

    return Text(
      displayedText,
      style: TextStyle(fontSize: 16, color: AppColors.blackColor),
    );
  }
}