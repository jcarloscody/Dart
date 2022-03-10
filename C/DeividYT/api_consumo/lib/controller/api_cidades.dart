import 'dart:convert';
import 'package:http/http.dart' as http;

class CidadesAPI {
  static callAPI() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(
            "https://servicodados.ibge.gov.br/api/v1/localidades/distritos"),
      );
      return jsonDecode(response.body) as List;
    } finally {
      client.close();
    }
  }
}
