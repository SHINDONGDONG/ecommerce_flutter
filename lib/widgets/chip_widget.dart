import 'package:ecommerce_flutter/constatns/themes.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String chipLabel;

  const ChipWidget({
    super.key, required this.chipLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Chip(label: Text(chipLabel),backgroundColor: Colors.grey.shade300),
    );
  }
}
