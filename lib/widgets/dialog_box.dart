import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox(
      {super.key,
      required this.title,
      required this.money,
      required this.onSave,
      required this.onCancel,
      required this.showDatetimePicker,
      required this.selectedDate});
  final TextEditingController title;
  final TextEditingController money;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final VoidCallback showDatetimePicker;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.purple[400],
      content: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Thêm chi phí'),
            TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: "Tên chi phí",
                hintStyle: GoogleFonts.roboto(color: Colors.blue[200]),
                border: const OutlineInputBorder(),
              ),
              style: GoogleFonts.roboto(color: Colors.blue),
            ),
            TextField(
              controller: money,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                hintText: "Tổng cộng",
                hintStyle: GoogleFonts.roboto(color: Colors.blue[200]),
                border: const OutlineInputBorder(),
              ),
              style: GoogleFonts.roboto(color: Colors.blue),
            ),
            CustomButton(onClick: showDatetimePicker, text: 'Chọn ngày'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: 'Add Taks',
                  onClick: onSave,
                ),
                CustomButton(
                  text: 'Cancel',
                  onClick: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
