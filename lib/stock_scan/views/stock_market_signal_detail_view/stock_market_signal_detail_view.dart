import 'package:flutter/material.dart';
import 'package:stock_scan_parser/stock_scan/view_models/stock_market_scan_view_model.dart';
import '../../models/stock_signal_model.dart';
import 'signal_status_container.dart';
import 'stock_market_signal_criteria.dart';

// This class represents the detailed view for a specific stock market signal.
class StockMarketSignalDetailView extends StatelessWidget {
  // Constructor for the StockMarketSignalDetailView widget.
  const StockMarketSignalDetailView({
    super.key,
    required this.signalId,
  });

  // The unique identifier of the stock market signal.
  final int signalId;

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Find the corresponding StockMarketSignalModel using the provided signalId.
    StockMarketSignalModel stockMarketSignalModel =
        StockMarketScanViewModel.of(context)!.stockMarketSignals.firstWhere(
              (stockMarketSignal) => stockMarketSignal.id == signalId,
            );

    // Scaffold widget for the overall structure of the detail view.
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.05 * MediaQuery.of(context).size.width,
        ),
        // ListView for vertically arranging signal details and criteria.
        child: ListView(
          children: [
            // Display the SignalStatusContainer with signal name, tag, and color.
            SignalStatusContainer(
              name: stockMarketSignalModel.name,
              tag: stockMarketSignalModel.tag,
              color: stockMarketSignalModel.color,
            ),
            // Display the StockMarketSignalCriteria for the signal's criteria.
            StockMarketSignalCriteria(
              signalCriteria: stockMarketSignalModel.criteria,
            ),
          ],
        ),
      ),
    );
  }
}
