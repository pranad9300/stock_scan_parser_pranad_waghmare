import 'package:flutter/material.dart';
import '../../../models/variables/indicator_variable_model.dart';
import 'indicator_variable_period_editor.dart';
import 'indicator_variable_study_type.dart';
import 'set_parameters_text.dart';

// This class represents the view for editing an Indicator Variable.
class IndicatorVariableEditorView extends StatelessWidget {
  // Constructor for the IndicatorVariableEditorView.
  const IndicatorVariableEditorView({
    super.key,
    required this.indicatorVariable,
  });

  // The IndicatorVariableModel that is being edited.
  final IndicatorVariableModel indicatorVariable;

  // Helper method to create a vertical gap between widgets.
  Widget _widgetGap() => const SizedBox(height: 15);

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Scaffold widget for the overall structure of the view.
    return Scaffold(
      body: SafeArea(
        // Padding for a consistent layout.
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.01 * MediaQuery.of(context).size.height,
            horizontal: 0.05 * MediaQuery.of(context).size.width,
          ),
          // Column for vertical arrangement of widgets.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Widget displaying the study type of the indicator variable.
              IndicatorStudyType(
                indicatorStudyType: indicatorVariable.studyType,
              ),
              // Vertical gap.
              _widgetGap(),
              // Widget for setting parameters.
              const SetParameterText(),
              // Vertical gap.
              _widgetGap(),
              // Widget for editing the period of the indicator variable.
              IndicatorVariablePeriodEditor(
                indicatorVariable: indicatorVariable,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
