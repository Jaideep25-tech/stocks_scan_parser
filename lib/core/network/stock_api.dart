import 'dart:convert';
import 'package:http/http.dart' as http;

var url = Uri.parse('http://coding-assignment.bombayrunning.com/data.json');

// api get using http package for fetching data

Future<dynamic> getData() async {
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
    return jsonResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
