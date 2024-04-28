import 'dart:convert';

import 'package:http/http.dart' as http ;

import '../models/response_model.dart';

class Network {
  Future<String> fetchData() async {
    var routesData= null;
    var url = Uri.parse('https://firebasestorage.googleapis.com/v0/b/jill-soap-6a1ac.appspot.com/o/maps.json?alt=media&token=bfd28b0f-06d7-4d25-8d45-e218466c7449');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var routesData= RoutesData.fromJson(jsonDecode(response.body) );
      return response.body;
    } else {
      // Request failed
      return "";
    }
  }
}