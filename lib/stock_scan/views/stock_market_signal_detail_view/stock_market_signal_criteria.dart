import 'package:flutter/material.dart';
import '../../models/criterion_model.dart';
import 'stock_market_signal_criterion.dart';

// This class represents a widget for displaying a list of stock market signal criteria.
class StockMarketSignalCriteria extends StatelessWidget {
  // Constructor for the StockMarketSignalCriteria widget.
  const StockMarketSignalCriteria({
    super.key,
    required this.signalCriteria,
  });

  // The list of CriterionModel instances representing signal criteria.
  final List<CriterionModel> signalCriteria;

  // Helper method to create a list of StockMarketSignalCriterion widgets.
  List<Widget> _criteriaUI() {
    int criterionIndex = 0;
    return signalCriteria
        .map(
          (criterion) => StockMarketSignalCriterion(
            criterion: criterion,
            // Check if the current criterion is the last in the list.
            isLast: ((criterionIndex++) == (signalCriteria.length - 1)),
          ),
        )
        .toList();
  }

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Padding widget for content alignment within the parent container.
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.03 * MediaQuery.of(context).size.width,
      ),
      // Column for vertical arrangement of StockMarketSignalCriterion widgets.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Use the helper method to generate the list of criteria widgets.
        children: _criteriaUI(),
      ),
    );
  }
}
