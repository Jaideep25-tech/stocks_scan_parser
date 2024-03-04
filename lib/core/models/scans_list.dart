import 'package:flutter/material.dart';
import 'package:stocks_scan_parser/core/models/stock.dart';
import 'package:stocks_scan_parser/core/network/stock_api.dart';

class ScansList with ChangeNotifier {
  List<StockModel> scansList = [];
  bool viewSubCriteria = false;
  int selectedCriteria = 0;
  late String? selectedVariableType;
  late List<dynamic>? selectedVariableValues;
  late String? selectedVariableParamName;
  late int? selectedVariableDefaultVal;

  // caling the api get function and initializing the data
  Future<dynamic> init() async {
    scansList.clear();
    final dynamic data = await getData() as dynamic;
    if (data != null) {
      for (var scan in data) {
        StockModel scanObj = StockModel(
          id: scan['id'],
          name: scan['name'],
          tag: scan['tag'],
          color: scan['color'],
          criteria: scan['criteria'],
        );
        scansList.add(scanObj);
      }
      return 'success';
    } else {
      return 'failure';
    }
  }

// managing the state for switching state between subcriteria and criteria
  void switchList() {
    viewSubCriteria = !viewSubCriteria;
    notifyListeners();
  }

  void selectVariable(
    String? type,
    List<dynamic>? values,
    String? paramName,
    int? val,
  ) {
    selectedVariableType = type;
    selectedVariableValues = values;
    selectedVariableParamName = paramName;
    selectedVariableDefaultVal = val;
  }
}
