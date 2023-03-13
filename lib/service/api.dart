import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/items.dart';

// ignore: camel_case_types
class apiservice {

  Future<List?> featchitem() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
        return Item.itemList(json.decode(response.body));
      } else {
        throw Exception('ERROR!!');
      }
  }
}