import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../stock_scan/models/criterion_model.dart';
import '../stock_scan/models/variables/indicator_variable_model.dart';
import '../stock_scan/models/variables/value_variable_model.dart';

// Class to handle criteria variable values and create clickable RichText
class CriteriaVariableValue {
  // Function to extract variable keys from a given text
  static Iterable<RegExpMatch> Function(String) get _extractVariableKeys =>
      (String text) {
        RegExp pattern = RegExp(r'\$(\d+)');

        // Find all matches in the input string
        Iterable<RegExpMatch> matches = pattern.allMatches(text);

        return matches;
      };

  // Function to get a RichText widget with clickable links for variables
  static RichText Function(
    BuildContext,
    CriterionModel,
    Function(BuildContext, String),
  ) get getVariableText => (
        BuildContext context,
        CriterionModel criterion,
        Function(BuildContext, String) onVariableTap,
      ) {
        Iterable<RegExpMatch> variableKeys =
            _extractVariableKeys(criterion.text);

        List<TextSpan> textSpans = [];

        int lastEnd = 0;

        // Iterate over matches and replace with clickable links
        for (RegExpMatch match in variableKeys) {
          String key = match.group(0)!;

          // Add the text before the current match without links
          textSpans.add(
              TextSpan(text: criterion.text.substring(lastEnd, match.start)));

          if (criterion.variables != null &&
              criterion.variables!.containsKey(key)) {
            final variable = criterion.variables![key]!;
            String linkText;

            if (variable.variableType == 'value') {
              // If variableType is 'value', use the first value
              double firstValue = double.tryParse(
                      (variable as ValueModel).values![0].toString()) ??
                  0.0;
              linkText = firstValue == firstValue.truncateToDouble()
                  ? firstValue.toStringAsFixed(
                      0) // Render fraction digits when not zero
                  : firstValue.toString();
            } else {
              // If variableType is 'indicator', use defaultValue
              double firstValue = double.tryParse(
                      (variable as IndicatorVariableModel)
                          .defaultValue
                          .toString()) ??
                  0.0;
              linkText = firstValue == firstValue.truncateToDouble()
                  ? firstValue.toStringAsFixed(
                      0) // Render fraction digits when not zero
                  : firstValue.toString();
            }

            linkText = '($linkText)';

            // Create a clickable link
            textSpans.add(
              TextSpan(
                text: linkText,
                style: const TextStyle(
                  color: Colors.purple,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => onVariableTap(context, key),
              ),
            );
          } else {
            // If the key is not found in variables, keep it unchanged
            textSpans.add(TextSpan(text: key));
          }

          // Update the last end position
          lastEnd = match.end;
        }

        // Add the remaining text without links
        textSpans.add(TextSpan(text: criterion.text.substring(lastEnd)));

        // Create and return RichText
        return RichText(text: TextSpan(children: textSpans));
      };
}
