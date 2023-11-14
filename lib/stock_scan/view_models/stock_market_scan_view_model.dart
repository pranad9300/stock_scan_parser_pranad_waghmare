import 'package:flutter/material.dart';
import '../models/stock_signal_model.dart';
import '../repository/stock_market_scan_repository.dart';

// Enumeration representing the status of the stock market scan
enum StockMarketScanStatus {
  loading,
  loaded,
  error,
}

// Widget representing the Stock Market Scan
class StockMarketScan extends StatefulWidget {
  const StockMarketScan({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<StockMarketScan> createState() => StockMarketScanState();
}

// State class for the StockMarketScan widget
class StockMarketScanState extends State<StockMarketScan> {
  final StockMarketScanRepository _stockMarketScanRepository =
      StockMarketScanRepository();
  List<StockMarketSignalModel> stockMarketSignals = [];
  late StockMarketScanStatus stockMarketScanStatus;

  // Method to update the state with stock market signals and status
  void _setStockMarketScanStatus(
    List<StockMarketSignalModel> stockMarketSignals_,
    StockMarketScanStatus status,
  ) {
    setState(() {
      stockMarketScanStatus = status;
      stockMarketSignals = stockMarketSignals_;
    });
  }

  // Method to get stock market signals asynchronously
  void getStockMarketSignals() async {
    List<StockMarketSignalModel> currentSignals = stockMarketSignals;
    _setStockMarketScanStatus(
      [],
      StockMarketScanStatus.loading,
    );
    List<StockMarketSignalModel> updatedStockMarketSignals =
        await _stockMarketScanRepository.getLocalStockMarketSignals();
    if (updatedStockMarketSignals.isNotEmpty) {
      _setStockMarketScanStatus(
        updatedStockMarketSignals,
        StockMarketScanStatus.loaded,
      );
      return;
    }
    _setStockMarketScanStatus(
      currentSignals,
      StockMarketScanStatus.error,
    );
  }

  // Lifecycle method called when the widget is first created
  @override
  void initState() {
    super.initState();
    getStockMarketSignals();
  }

  // Build method to create the UI for the StockMarketScan widget
  @override
  Widget build(BuildContext context) => StockMarketScanViewModel(
        stateWidget: this,
        stockMarketSignals: stockMarketSignals,
        child: widget.child,
      );
}

// InheritedWidget for passing the state and stock market signals down the widget tree
class StockMarketScanViewModel extends InheritedWidget {
  final StockMarketScanState stateWidget;
  final List<StockMarketSignalModel> stockMarketSignals;

  const StockMarketScanViewModel({
    Key? key,
    required Widget child,
    required this.stateWidget,
    required this.stockMarketSignals,
  }) : super(key: key, child: child);

  // Method to retrieve the StockMarketScanViewModel from the widget tree
  static StockMarketScanViewModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StockMarketScanViewModel>();
  }

  // Method to determine if an update is necessary
  @override
  bool updateShouldNotify(StockMarketScanViewModel oldWidget) {
    return oldWidget.stockMarketSignals != stockMarketSignals;
  }
}
