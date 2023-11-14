import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/stock_signal_model.dart';

class StockScanLocalDataService {
  // Method to get stock market signals from local JSON data
  Future<List<StockMarketSignalModel>> getStockMarketSignals() async {
    try {
      // Load JSON data from the assets folder
      String dataString =
          await rootBundle.loadString('assets/stock_scan_data.json');
      // Decode JSON data into a list of dynamic objects
      List<dynamic> signalsData = json.decode(dataString);

      // Map the dynamic objects to StockMarketSignalModel and convert to a list
      return signalsData
          .map((signalMap) => StockMarketSignalModel.fromMap(signalMap))
          .cast<StockMarketSignalModel>()
          .toList();
    } catch (e) {
      // Return an empty list if an error occurs during data retrieval
      return [];
    }
  }
}
