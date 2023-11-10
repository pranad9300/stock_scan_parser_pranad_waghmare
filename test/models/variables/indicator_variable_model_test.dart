import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan_parser/stock_scan/models/base_variable_model.dart';
import 'package:stock_scan_parser/stock_scan/models/variables/indicator_variable_model.dart';

void main() {
  group('IndicatorVariableModel', () {
    test('fromMap should create an IndicatorVariableModel from a valid map',
        () {
      // Arrange
      String fixturePath = 'test/fixtures/indicator_model_fixture.json';
      Map<String, dynamic> map =
          json.decode(File(fixturePath).readAsStringSync());

      // Act
      var indicatorVariable = IndicatorVariableModel.fromMap(map);

      // Assert
      expect(indicatorVariable, isA<VariableModel>());
      expect(indicatorVariable, isNotNull);
      expect(indicatorVariable.variableType, map['type']);
      expect(indicatorVariable.studyType, map['study_type']);
      expect(indicatorVariable.parameterName, map['parameter_name']);
      expect(indicatorVariable.minValue, map['min_value']);
      expect(indicatorVariable.maxValue, map['max_value']);
      expect(indicatorVariable.defaultValue, map['default_value']);
    });

    test('fromMap should return VariableModel for an invalid map', () {
      // Arrange
      Map<String, dynamic>? invalidMap; // Set to null for this negative test

      // Act
      final indicatorVariable = IndicatorVariableModel.fromMap(invalidMap);

      // Assert
      expect(indicatorVariable, isA<VariableModel>());
      expect(indicatorVariable, isA<IndicatorVariableModel>());
    });
  });
}
