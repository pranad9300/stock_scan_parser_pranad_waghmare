import '../data/stock_scan_local_data_service.dart';
import '../models/stock_signal_model.dart';

class StockMarketScanRepository {
  // Instance of StockScanLocalDataService for handling local data operations
  final StockScanLocalDataService _stockScanLocalDataService =
      StockScanLocalDataService();

  // Method to get local stock market signals from the data service
  Future<List<StockMarketSignalModel>> getLocalStockMarketSignals() async {
    try {
      // Call the getStockMarketSignals method from the local data service
      // to retrieve a list of stock market signals from local JSON data
      return await _stockScanLocalDataService.getStockMarketSignals();
    } catch (e) {
      /// Return an empty list if an error occurs during data retrieval
      return [];
    }
  }
}
