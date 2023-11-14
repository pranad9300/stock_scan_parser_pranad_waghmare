import 'package:flutter/material.dart';

// This class represents a container for displaying signal status information.
class SignalStatusContainer extends StatelessWidget {
  // Constructor for the SignalStatusContainer widget.
  const SignalStatusContainer({
    super.key,
    required this.name,
    required this.tag,
    required this.color,
  });

  // The name of the signal.
  final String name;

  // The tag associated with the signal.
  final String tag;

  // The color of the signal, used for styling.
  final String color;

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Container widget for the overall structure of the status container.
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      // Margin for spacing between status containers.
      margin: EdgeInsets.symmetric(
        vertical: 0.02 * MediaQuery.of(context).size.height,
      ),
      // Padding for content alignment within the container.
      padding: EdgeInsets.symmetric(
        horizontal: 0.03 * MediaQuery.of(context).size.width,
        vertical: 0.01 * MediaQuery.of(context).size.height,
      ),
      // BoxDecoration for styling the container background.
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      // Column for vertical arrangement of text elements.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text widget displaying the signal name with medium title text style.
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          // Text widget displaying the signal tag with custom styling.
          Text(
            tag,
            style: TextStyle(
              fontSize: 10,
              color: color == 'green' ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
