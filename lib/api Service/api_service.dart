import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/models/store_model.dart';

class ApiService {
  static Future<List<StoreModel>> getData() async {
    // Use try catch
    try {
      // make initial Api call
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      // handle the response
      if (response.statusCode == 200) {
        // parse data
        List jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        return jsonResponse.map((data) => StoreModel.fromJson(data)).toList();
      } else {
        throw Exception('Something Went Wrong');
      }
    } catch (e) {
      // catch the exception
      print(e);
      throw Exception('Something Went Wrong');
    }
  }
}
