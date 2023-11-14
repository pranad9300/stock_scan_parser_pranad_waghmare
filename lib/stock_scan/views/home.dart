import 'package:flutter/material.dart';
import 'stock_market_scan_view/stock_market_scan_view.dart';

// This class represents the home screen of the Stock Scan Parser app.
class StockScanParserHome extends StatelessWidget {
  // Constructor for the StockScanParserHome widget.
  const StockScanParserHome({
    super.key,
  });

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Display the StockMarketScanView as the main content of the home screen.
    return const StockMarketScanView();
  }
}
