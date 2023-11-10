import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan_parser/stock_scan/models/base_variable_model.dart';
import 'package:stock_scan_parser/stock_scan/models/variables/value_variable_model.dart';

void main() {
  group('ValueModel', () {
    test('should create a ValueModel instance from a valid map', () async {
      // Arrange
      String jsonContent =
          await File('test/fixtures/value_model_fixtures.json').readAsString();
      Map<String, dynamic> validMap = json.decode(jsonContent);

      // Act
      ValueModel valueModel = ValueModel.fromMap(validMap);

      // Assert
      expect(valueModel, isA<VariableModel>());
      expect(valueModel.variableType, equals(validMap['type']));
      expect(valueModel.values, equals(validMap['values']));
    });

    test('fromMap should return VariableModel for an invalid map', () {
      // Arrange
      Map<String, dynamic>? invalidMap;

      // act
      final valueModel = ValueModel.fromMap(invalidMap);

      // Assert
      expect(valueModel, isA<VariableModel>());
    });
  });
}
