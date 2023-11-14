import 'package:flutter/material.dart';
import 'stock_scan/views/home.dart';
import 'stock_scan/views/shared/indicator_variable_editor/indicator_variable_editor_view.dart';
import 'stock_scan/views/shared/value_variable_options/value_variable_options_view.dart';
import 'stock_scan/views/stock_market_signal_detail_view/stock_market_signal_detail_view.dart';

// This class defines the routes and navigation for the Stock Scan Parser app.
class AppRoutes {
  // Route names for various screens in the app.
  static const String initial = '/';
  static const String stockMarketSignalDetail = '/stockMarketSignalDetail';
  static const String valueOptions = '/valueOptions';
  static const String indicatorEditor = '/indicatorEditor';

  // Function to generate routes based on the provided settings.
  static Route Function(RouteSettings settings) get onGenerateRoute =>
      (RouteSettings settings) {
        switch (settings.name) {
          // Initial route pointing to the home screen.
          case initial:
            return MaterialPageRoute(
              builder: (_) => const StockScanParserHome(),
            );
          // Route for displaying the stock market signal detail view.
          case stockMarketSignalDetail:
            return MaterialPageRoute(
              builder: (_) => StockMarketSignalDetailView(
                signalId: (settings.arguments as Map<String, int>)['signalId']!,
              ),
            );
          // Route for displaying the value variable options view.
          case valueOptions:
            return MaterialPageRoute(
              builder: (_) => ValueVariableViewOptionsView(
                valueVariable:
                    (settings.arguments as Map<String, dynamic>)['variable']!,
              ),
            );
          // Route for displaying the indicator variable editor view.
          case indicatorEditor:
            return MaterialPageRoute(
              builder: (_) => IndicatorVariableEditorView(
                indicatorVariable:
                    (settings.arguments as Map<String, dynamic>)['variable']!,
              ),
            );
          // Default route pointing to the home screen.
          default:
            return MaterialPageRoute(
              builder: (_) => const StockScanParserHome(),
            );
        }
      };
}
