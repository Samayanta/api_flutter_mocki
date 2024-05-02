import 'package:api/model/cart_model.dart';
import 'package:http/http.dart' as http;

class GetApiServices {
  Future<List<Auth>?> getAuthInfo() async {
    var data = http.Client();
    var uri =
        Uri.parse("https://mocki.io/v1/1fa0fa18-6a1e-4f79-901d-e2097517a695");
    var response = await data.get(uri);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return authFromJson(jsonString);
    } else {
      return null;
    }
  }
}
