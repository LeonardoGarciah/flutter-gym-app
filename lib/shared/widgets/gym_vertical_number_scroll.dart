import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gym_app/shared/widgets/gym_text.dart';

class GymVerticalNumberScroll extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onValueChanged;

  const GymVerticalNumberScroll({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  State<GymVerticalNumberScroll> createState() => _GymVerticalNumberScrollState();
}

class _GymVerticalNumberScrollState extends State<GymVerticalNumberScroll> {
  late int _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      scrollController: FixedExtentScrollController(initialItem: _selectedValue - widget.minValue),
      itemExtent: 40.0, // Adjust item height as needed
      children: List.generate(widget.maxValue - widget.minValue + 1, (index) {
        final value = index + widget.minValue;
        return Center(
          child: GymText(
            value.toString(),
          ),
        );
      }),
      onSelectedItemChanged: (int index) {
        setState(() {
          _selectedValue = index + widget.minValue;
          widget.onValueChanged(_selectedValue);
        });
      },
    );
  }
}