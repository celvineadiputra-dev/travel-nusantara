import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimension.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final Color color;
  final TextEditingController inputController;

  const InputWidget({Key? key, required this.label,  required this.inputController, this.color = primary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          hintText: label,
          labelText: label,
          filled: true,
          fillColor: gray3,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color, width: d2),
              borderRadius: BorderRadius.circular(d10)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: d2),
              borderRadius: BorderRadius.circular(d10)
          )
      ),
    );
  }
}
