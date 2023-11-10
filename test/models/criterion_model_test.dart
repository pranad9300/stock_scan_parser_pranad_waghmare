import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan_parser/stock_scan/models/base_variable_model.dart';
import 'package:stock_scan_parser/stock_scan/models/criterion_model.dart';

void main() {
  group('CriterionModel', () {
    test(
        'should create a CriterionModel instance from valid JSON data in a file',
        () {
      // Arrange
      final file = File('test/fixtures/criterion_model_fixture.json');
      final jsonString = file.readAsStringSync();
      final jsonData = json.decode(jsonString);
      final String criterionIndex = Random().nextInt(2).toString();
      final int criterionElementIndex = Random().nextInt(3);
      // Act
      final criterion = CriterionModel.fromMap(
          jsonData[criterionIndex][criterionElementIndex]);

      // Assert
      expect(criterion.text,
          jsonData[criterionIndex][criterionElementIndex]['text']);
      expect(criterion.type,
          jsonData[criterionIndex][criterionElementIndex]['type']);
      expect(criterion.variables, isA<List<Map<String, VariableModel>>>());
    });

    test(
        'should create a CriterionModel instance with default values for missing data',
        () {
      // Arrange
      final jsonData = {};

      // Act
      final criterion = CriterionModel.fromMap(jsonData);

      // Assert
      expect(criterion.text, '');
      expect(criterion.type, '');
      expect(criterion.variables, isEmpty);
    });
  });
}
