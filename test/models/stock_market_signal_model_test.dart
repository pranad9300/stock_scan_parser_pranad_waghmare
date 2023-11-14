import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan_parser/stock_scan/models/criterion_model.dart';
import 'package:stock_scan_parser/stock_scan/models/stock_signal_model.dart';

void main() {
  group('StockMarketSignalModel', () {
    test('should create an instance with valid data from a JSON file',
        () async {
      // Arrange
      final jsonString =
          await File('test/fixtures/stock_market_signal_fixture.json')
              .readAsString();
      final int marketSignalIndex = Random().nextInt(5);
      final validData = json.decode(jsonString)[marketSignalIndex];

      // Act
      final signalModel = StockMarketSignalModel.fromMap(validData);

      // Assert
      expect(signalModel.id, validData['id']);
      expect(signalModel.name, validData['name']);
      expect(signalModel.tag, validData['tag']);
      expect(signalModel.color, validData['color']);
      expect(signalModel.criteria, isA<List<CriterionModel>>());
      expect(signalModel.criteria, hasLength(validData['criteria']?.length));
    });

    test(
        'should create an instance with empty data when provided with invalid data',
        () {
      // Arrange
      final Map<String, dynamic> invalidData = {
        // Missing 'id', 'name', 'tag', 'color', and 'criteria'
      };

      // Act
      final signalModel = StockMarketSignalModel.fromMap(invalidData);

      // Assert
      expect(signalModel.id, 0);
      expect(signalModel.name, '');
      expect(signalModel.tag, '');
      expect(signalModel.color, '');
      expect(signalModel.criteria, isEmpty);
    });
  });
}
