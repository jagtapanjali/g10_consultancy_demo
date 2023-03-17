import 'package:http/http.dart' as http;

class RemoteServices {
  static Future<String?> fetchProductList(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      // return campaignsFromJson(jsonString);
      return jsonString;
    } else {
      //show error message
      return null;
    }
  }
}
