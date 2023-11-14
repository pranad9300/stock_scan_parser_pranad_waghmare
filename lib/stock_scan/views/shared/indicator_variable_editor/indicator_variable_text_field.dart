import 'package:flutter/material.dart';

// This class represents a widget for inputting values for an Indicator Variable.
class IndicatorVariableInput extends StatelessWidget {
  // Constructor for the IndicatorVariableInput widget.
  const IndicatorVariableInput({
    super.key,
    required this.defaultValue,
  });

  // The default value for the input field.
  final String defaultValue;

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Create a text controller with the provided default value.
    final controller = TextEditingController(
      text: defaultValue,
    );
    // Set the cursor at the end of the text in the input field.
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    // Return a sized box containing a text field for inputting values.
    return SizedBox(
      width: 0.55 * MediaQuery.of(context).size.width,
      child: TextField(
        // Assign the created controller to the text field.
        controller: controller,
        // Set the keyboard type to number for numerical input.
        keyboardType: TextInputType.number,
      ),
    );
  }
}
