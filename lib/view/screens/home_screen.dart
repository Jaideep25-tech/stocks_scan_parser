import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_scan_parser/core/models/scans_list.dart';
import 'package:stocks_scan_parser/view/widgets/homescreen_widgets/scan_tiles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
          future: Provider.of<ScansList>(context, listen: false).init(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == 'success') {
                return const ScanView();
              } else {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
