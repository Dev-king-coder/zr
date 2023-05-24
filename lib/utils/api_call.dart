import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<String?> getKey() async {
    try {
      await dotenv.load(fileName: "lib/key.env");
      final String? key = dotenv.env['OPEN_AI_API_KEY'];
      return key;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> postData() async {
    String? apikey = await getKey();
    const url = 'https://api.openai.com/v1/chat/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apikey'
    };
    Map<String, Object> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": "this is a test"}
      ],
      "temperature": 0.1
    };
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final jsonRes = jsonDecode(response.body);
        // print(jsonRes['choices'][0]['message']['content'].split('\n  \\')[0]);
        // print(jsonRes['choices'][0]['message']['content']);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
