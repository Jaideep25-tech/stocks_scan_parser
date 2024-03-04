import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_scan_parser/core/models/scans_list.dart';
import 'package:stocks_scan_parser/view/screens/scan_screen.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    final stockScans = Provider.of<ScansList>(context).scansList;
    //displaying the list fetched from api
    return ListView.builder(
        itemCount: stockScans.length,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                // navigating to respective detailed view
                Navigator.pushNamed(
                  context,
                  ScanScreen.routeName,
                  arguments: index,
                );
              },
              title: Text(stockScans[index].name),
              subtitle: Text(
                stockScans[index].tag,
                style: TextStyle(
                  color: stockScans[index].color == 'red'
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ));
  }
}
