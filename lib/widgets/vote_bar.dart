import 'package:flutter/material.dart';

class VoteBar extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  VoteBar({required this.value, required this.onChanged});

  @override
  _VoteBarState createState() => _VoteBarState();
}

class _VoteBarState extends State<VoteBar> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.value,
      onChanged: widget.onChanged,
      min: 0,
      max: 10,
      divisions: 10,
      label: widget.value.toString(),
    );
  }
}
