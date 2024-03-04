import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_scan_parser/core/models/scans_list.dart';
import 'package:stocks_scan_parser/view/widgets/scan_screen_widgets/criteria_tiles.dart';
import 'package:stocks_scan_parser/view/widgets/scan_screen_widgets/scan_app_bar.dart';
import 'package:stocks_scan_parser/view/widgets/scan_screen_widgets/sub_criteria.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});
  static const routeName = '/scan-screen';

  @override
  Widget build(BuildContext context) {
    final int scanIndex = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: ScanAppBar(
        scanIndex: scanIndex,
        callBAck: Provider.of<ScansList>(context).viewSubCriteria,
      ),
      body: Provider.of<ScansList>(context).viewSubCriteria
          ? const SubCriteriaView()
          : CriteriaView(
              scanIndex: scanIndex,
            ),
    );
  }
}
