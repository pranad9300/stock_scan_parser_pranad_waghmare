import 'package:flutter/material.dart';

// This class represents a widget for displaying the study type of an Indicator Variable.
class IndicatorStudyType extends StatelessWidget {
  // Constructor for the IndicatorStudyType widget.
  const IndicatorStudyType({
    super.key,
    required this.indicatorStudyType,
  });

  // The study type string to be displayed.
  final String indicatorStudyType;

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Text widget displaying the uppercase study type.
    return Text(
      indicatorStudyType.toUpperCase(),
      // Apply the titleMedium text style from the current theme.
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
