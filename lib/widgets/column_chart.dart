import 'package:flutter/material.dart';

class ColumnChart extends StatelessWidget {
  final String optionText;
  final int money;
  final int sum;
  final Color backgroundColor;
  final Color foregroundColor;

  const ColumnChart({
    super.key,
    required this.optionText,
    required this.money,
    required this.sum,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    String day = '';
    switch (optionText) {
      case '0':
        day = 'Chủ nhật';
        break;
      case '1':
        day = 'Thứ 2';
        break;
      case '2':
        day = 'Thứ 3';
        break;
      case '3':
        day = 'Thứ 4';
        break;
      case '4':
        day = 'Thứ 5';
        break;
      case '5':
        day = 'Thứ 6';
        break;
      case '6':
        day = 'Thứ 7';
        break;
    }
    double percent = 0;
    if (money != 0 && sum != 0) {
      percent = money / sum;
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${money.toStringAsFixed(3)} đ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        LinearProgressIndicator(
          value: percent,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
        ),
        const SizedBox(height: 1),
      ],
    );
  }
}
