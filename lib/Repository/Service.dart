import 'dart:convert';
import 'package:baby_madics/Design/Strings.dart';
import 'package:http/http.dart' as http;

class Service {

  Future<bool> getServices() async {
    final response = await http.get(
      Uri.https(Strings.pathAPI, Strings.apiServiceGet),

    );
    if (response.statusCode >= 200 && response.statusCode < 227) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }
    return null;
  }

}
