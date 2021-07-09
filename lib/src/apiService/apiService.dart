import 'package:getx_api/src/models/productModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static ProductModel productModel;

  static Future<List<ProductModel>> fetchApi() async {
    print("in fetchApi");
    var response = await client.get(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie');
    if (response.statusCode == 200) {
      print("Data is got");
      var json = response.body;
      return productFromJson(json);
    } else {
      print("Fetching Api Error");
    }
  }
}
