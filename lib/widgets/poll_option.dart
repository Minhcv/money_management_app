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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              optionText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${percent.toStringAsFixed(2)}%',
              style: TextStyle(
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
        SizedBox(height: 10),
      ],
    );
  }
}
