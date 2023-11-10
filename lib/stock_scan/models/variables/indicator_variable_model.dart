import '../base_variable_model.dart';

class IndicatorVariableModel extends VariableModel {
  // Type of study associated with the indicator, e.g., "cci"
  final String studyType;

  // Name of the parameter, e.g., "period"
  final String parameterName;

  // Minimum allowed value for the parameter
  final double minValue;

  // Maximum allowed value for the parameter
  final double maxValue;

  // Default value for the parameter
  final double defaultValue;

  // Constructor for initializing IndicatorParameter instances
  IndicatorVariableModel({
    required super.variableType,
    required this.studyType,
    required this.parameterName,
    required this.minValue,
    required this.maxValue,
    required this.defaultValue,
  });

  // Factory method to create an IndicatorParameter instance from a map
  factory IndicatorVariableModel.fromMap(dynamic map) {
    return IndicatorVariableModel(
      // Set 'variableType' to the value in the map or an empty string if null
      variableType: map?['type'] ?? '',

      // Set 'studyType' to the value in the map or an empty string if null
      studyType: map?['study_type'] ?? '',

      // Set 'parameterName' to the value in the map or an empty string if null
      parameterName: map?['parameter_name'] ?? '',

      // Set 'minValue' to the value in the map or 0 if null
      minValue: double.parse(map?['min_value'].toString() ?? 0.toString()),

      // Set 'maxValue' to the value in the map or 0 if null
      maxValue: double.parse(map?['max_value'].toString() ?? 0.toString()),

      // Set 'defaultValue' to the value in the map or 0 if null
      defaultValue:
          double.parse(map?['default_value'].toString() ?? 0.toString()),
    );
  }
}
