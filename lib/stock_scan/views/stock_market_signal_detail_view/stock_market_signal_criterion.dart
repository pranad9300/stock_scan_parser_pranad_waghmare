import 'package:flutter/material.dart';
import '../../../routes.dart';
import '../../../utils/criteria_variables_value.dart';
import '../../models/criterion_model.dart';
import '../../models/variables/value_variable_model.dart';

// This class represents a widget for displaying a stock market signal criterion.
class StockMarketSignalCriterion extends StatelessWidget {
  // Constructor for the StockMarketSignalCriterion widget.
  const StockMarketSignalCriterion({
    super.key,
    required this.criterion,
    required this.isLast,
  });

  // The CriterionModel instance representing the signal criterion.
  final CriterionModel criterion;

  // Boolean flag indicating whether this criterion is the last in the list.
  final bool isLast;

  // Method to handle tap on a variable and navigate to its details or editor.
  void _onVariableTap(BuildContext context, String key) {
    final variable = criterion.variables![key];

    if (variable is ValueModel) {
      // Navigate to the value options page for the value variable.
      Navigator.of(context).pushNamed(
        AppRoutes.valueOptions,
        arguments: {
          'variable': variable,
        },
      );
      return;
    }
    // Navigate to the indicator editor page for the indicator variable.
    Navigator.of(context).pushNamed(
      AppRoutes.indicatorEditor,
      arguments: {
        'variable': variable,
      },
    );
    return;
  }

  // Widget for rendering criteria with plain text.
  Widget _plainTextCriteria(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text widget displaying the plain text criterion with medium title text style.
        Text(
          criterion.text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        // If not the last criterion, add vertical spacing.
        if (!isLast)
          const SizedBox(
            height: 10,
          ),
        // If not the last criterion, display 'and' with small body text style.
        if (!isLast)
          Text(
            'and',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        // If not the last criterion, add more vertical spacing.
        if (!isLast)
          const SizedBox(
            height: 10,
          ),
      ],
    );
  }

  // Widget for rendering criteria with variables.
  Widget _variableCriteria(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Get variable text based on the type using CriteriaVariableValue utility.
        CriteriaVariableValue.getVariableText(
          context,
          criterion,
          _onVariableTap,
        ),
        // If not the last criterion, add vertical spacing.
        if (!isLast)
          const SizedBox(
            height: 10,
          ),
        // If not the last criterion, display 'and' with small body text style.
        if (!isLast)
          Text(
            'and',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        // If not the last criterion, add more vertical spacing.
        if (!isLast)
          const SizedBox(
            height: 10,
          ),
      ],
    );
  }

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Determine the type of criterion and choose the appropriate UI.
    Widget criteriaUI = criterion.type == 'plain_text'
        ? _plainTextCriteria(context)
        : _variableCriteria(context);
    return criteriaUI;
  }
}
