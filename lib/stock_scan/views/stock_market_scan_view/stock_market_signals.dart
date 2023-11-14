import 'package:flutter/material.dart';
import '../../models/stock_signal_model.dart';
import 'stock_market_signal.dart';

// This class represents a widget for displaying a list of stock market signals.
class StockMarketSignals extends StatelessWidget {
  // Constructor for the StockMarketSignals widget.
  const StockMarketSignals({
    super.key,
    required this.stockMarketSignals,
  });

  // The list of StockMarketSignalModel instances to be displayed.
  final List<StockMarketSignalModel> stockMarketSignals;

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // ListView.builder for dynamically displaying StockMarketSignal widgets.
    return ListView.builder(
      itemCount: stockMarketSignals.length,
      // ItemBuilder for creating StockMarketSignal widgets for each signal.
      itemBuilder: (context, index) => StockMarketSignal(
        stockMarketSignal: stockMarketSignals[index],
      ),
    );
  }
}
