import 'criterion_model.dart' show CriterionModel;

// Define the StockMarketSignalModel class with specified properties and types
class StockMarketSignalModel {
  // Unique identifier for the model
  int id;

  // Name associated with the model
  String name;

  // Tag to categorize the model
  String tag;

  // Color associated with the model
  String color;

  // List of criteria that define the stock market signal
  List<CriterionModel> criteria;

  // Constructor for initializing StockMarketSignalModel instances
  StockMarketSignalModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  // Factory method to create a StockMarketSignalModel instance from a map
  factory StockMarketSignalModel.fromMap(Map<String, dynamic> map) {
    return StockMarketSignalModel(
      // Set 'id' to the value in the map or an empty string if null
      id: map['id'] ?? '',

      // Set 'name' to the value in the map or an empty string if null
      name: map['name'] ?? '',

      // Set 'tag' to the value in the map or an empty string if null
      tag: map['tag'] ?? '',

      // Set 'color' to the value in the map or an empty string if null
      color: map['color'] ?? '',

      // Map each item in the 'criteria' list to a Criterion instance
      criteria: (map['criteria'] as List<dynamic>?)
              ?.map((criterionMap) => CriterionModel.fromMap(criterionMap))
              .toList() ??
          [], // If 'criteria' is null, set it to an empty list
    );
  }
}
