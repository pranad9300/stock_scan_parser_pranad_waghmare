import 'package:flutter/material.dart';
import '../../view_models/stock_market_scan_view_model.dart';
import 'stock_market_signals.dart';

// This class represents the view for displaying stock market scan results.
class StockMarketScanView extends StatelessWidget {
  // Constructor for the StockMarketScanView.
  const StockMarketScanView({super.key});

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Access the state from the StockMarketScanViewModel.
    StockMarketScanState? state =
        StockMarketScanViewModel.of(context)?.stateWidget;

    // Scaffold widget for the overall structure of the view.
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.05 * MediaQuery.of(context).size.width,
          vertical: 0.04 * MediaQuery.of(context).size.height,
        ),
        // Center widget to center the content vertically.
        child: Center(
          // Conditional rendering based on the scan status.
          child: state!.stockMarketScanStatus == StockMarketScanStatus.loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                )
              : state.stockMarketScanStatus == StockMarketScanStatus.loaded
                  ? StockMarketSignals(
                      stockMarketSignals: state.stockMarketSignals,
                    )
                  : const Text(
                      'Error while loading stock scan.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
        ),
      ),
    );
  }
}
