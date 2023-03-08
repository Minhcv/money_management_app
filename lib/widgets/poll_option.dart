import 'package:flutter/material.dart';

class PollOption extends StatelessWidget {
  final String optionText;
  final double percent;
  final Color backgroundColor;
  final Color foregroundColor;

  PollOption({
    required this.optionText,
    required this.percent,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              optionText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${percent.toStringAsFixed(3)} đ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        LinearProgressIndicator(
          value: percent / 100,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
        ),
        SizedBox(height: 1),
      ],
    );
  }
}
