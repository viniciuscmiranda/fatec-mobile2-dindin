import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class PriceHelper {
  Future<Map> getCurrencyPrice() async {
    var uri = Uri.https('api.hgbrasil.com', 'finance', {'key': '363d755d'});

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    var response = await http.get(uri, headers: headers);
    return json.jsonDecode(response.body)['results']['currencies'];
  }
}
