import 'package:flutter/material.dart';
import '../../../routes.dart';
import '../../models/stock_signal_model.dart';
import '../shared/widgets/dotted_border.dart';

// This class represents a widget for displaying a stock market signal.
class StockMarketSignal extends StatelessWidget {
  // Constructor for the StockMarketSignal widget.
  const StockMarketSignal({
    super.key,
    required this.stockMarketSignal,
  });

  // The StockMarketSignalModel to be displayed.
  final StockMarketSignalModel stockMarketSignal;

  // Helper method to create a Text widget for the signal name.
  Text _signalName() => Text(
        stockMarketSignal.name,
        softWrap: true,
      );

  // Helper method to create a Text widget for the signal tag.
  Text _signalTag() => Text(
        stockMarketSignal.tag,
        softWrap: true,
        style: TextStyle(
          color: stockMarketSignal.color == 'green' ? Colors.green : Colors.red,
        ),
      );

  // Method to handle tap on the stock market signal and navigate to its detail page.
  void _onStockMarketSignalTap(BuildContext context) => Navigator.of(context)
          .pushNamed(AppRoutes.stockMarketSignalDetail, arguments: {
        'signalId': stockMarketSignal.id,
      });

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // CustomPaint widget to draw a dotted border around the ListTile.
    return CustomPaint(
      painter: DottedBorderPainter(),
      // ListTile for displaying the signal name and tag.
      child: ListTile(
        // Handle tap on the ListTile.
        onTap: () => _onStockMarketSignalTap(context),
        // Display the signal name as the title.
        title: _signalName(),
        // Display the signal tag as the subtitle with color based on signal color.
        subtitle: _signalTag(),
      ),
    );
  }
}
