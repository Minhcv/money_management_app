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
      required this.onCancel});
  final TextEditingController title;
  final TextEditingController money;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.purple[400],
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
            // Text('Selected Date: ${dateCreate.toString()}'),
            // SizedBox(height: 20.0),
            // FloatingActionButton(
            //   onPressed: () => {dateCreate = context as DateRangePickerDialog},
            //   child: Text('Select date'),
            // ),
          ],
        ),
      ),
    );
  }
}
