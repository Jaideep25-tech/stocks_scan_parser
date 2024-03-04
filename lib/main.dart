import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_scan_parser/core/models/scans_list.dart';
import 'package:stocks_scan_parser/view/screens/scan_screen.dart';
import 'view/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ScansList(),
      child: const StockScanParser(),
    ),
  );
}

class StockScanParser extends StatelessWidget {
  const StockScanParser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Scan Parser',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Stock Scans'),
      routes: {
        ScanScreen.routeName: (context) => const ScanScreen(),
      },
    );
  }
}
