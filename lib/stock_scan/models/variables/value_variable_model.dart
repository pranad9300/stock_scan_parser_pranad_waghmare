import '../base_variable_model.dart';

// The ValueModel class is a subclass of VariableModel, representing a model
// that holds a list of integer values.
class ValueModel extends VariableModel {
  // The constructor takes a list of integer values and a required variable type.
  // It calls the superclass constructor using the 'super' keyword.
  ValueModel({
    required super.variableType,
    required this.values,
  });

  // A list to store integer values associated with this ValueModel.
  final List<double>? values;

  // A factory method to create a ValueModel instance from a map.
  // This is useful for converting data received from external sources, such as APIs.
  factory ValueModel.fromMap(dynamic map) {
    // Extract values from the map.
    List<double> values = (map?['values'] as List?)
            ?.map((value) => double.parse(value.toString()))
            .cast<double>()
            .toList() ??
        [];

    // Extract variable type from the map.
    String variableType = map?['type'] ?? '';

    // Return a new ValueModel instance with the extracted values and variable type.
    return ValueModel(
      variableType: variableType,
      values: values,
    );
  }
}
