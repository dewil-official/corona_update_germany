import 'package:http/http.dart' as http;

class HttpHandler {
  static get(String url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return "${response.body}";
    } else {
      return "Error.";
    }
  }
}
