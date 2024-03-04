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
      // fututre building calling the function to initialize the list with response fetched
      // Using future builder to effectively manage the calling of api and rendering UI accordingly
      body: FutureBuilder(
          future: Provider.of<ScansList>(context, listen: false).init(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == 'success') {
                // if data is successfully fetched showing scan result UI
                // else displaying text message
                return const ScanView();
              } else {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              }
              // while the response is being fetched displayong circular progress indicator
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
