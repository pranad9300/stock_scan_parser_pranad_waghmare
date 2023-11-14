// Define the CriterionModel class with specified properties and types
import 'base_variable_model.dart';
import 'variables/indicator_variable_model.dart';
import 'variables/value_variable_model.dart';

/// Returns relevant variable models from variable map
Map<String, VariableModel>? getVariables(
  Map<String, dynamic>? variablesMap,
) {
  // Initialize an empty list to store the variable models.
  Map<String, VariableModel> variables = {};

  // Check if the provided variable map is not null.
  variablesMap?.forEach((key, map) {
    // Determine the type of the variable based on the 'type' field in the map.
    switch (map['type']) {
      // If the type is 'value', create a ValueModel instance using the fromMap method.
      case 'value':
        variables.putIfAbsent(
          key,
          () => ValueModel.fromMap(map),
        );
        break;
      // If the type is 'indicator', create an IndicatorVariableModel instance using fromMap.
      case 'indicator':
        variables.putIfAbsent(
          key,
          () => IndicatorVariableModel.fromMap(map),
        );
        break;
    }
  });

  // Return the list of variable models. It may be null if the input map is null.
  return variables;
}

class CriterionModel {
  // The text associated with the criterion
  String text;

  // The type of the criterion
  String type;

  // A list of maps with string keys and variable values
  Map<String, VariableModel>? variables;

  // Constructor for initializing CriterionModel instances
  CriterionModel({
    required this.text,
    required this.type,
    required this.variables,
  });

  // Factory method to create a CriterionModel instance from a JSON map
  factory CriterionModel.fromMap(dynamic criterionMap) {
    return CriterionModel(
      // Set 'text' to the value in the JSON map or an empty string if null
      text: criterionMap['text'] ?? '',

      // Set 'type' to the value in the JSON map or an empty string if null
      type: criterionMap['type'] ?? '',

      // Set 'variables' to the value in the JSON map or an empty list if null
      variables: getVariables(criterionMap['variable'] ?? {}),
    );
  }
}
