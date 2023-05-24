import 'package:http/http.dart' as http;

class ApiService {
  static Future<http.Response> getData() async {
    // Use try catch
    try {
      // make initial Api call
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      // handle the response
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        throw Exception('Something Went Wrong');
      }
      throw Exception('Something Went Wrong');
    } catch (e) {
      // catch the exception
      print(e);
      throw Exception('Something Went Wrong');
    }
  }
}
