import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:project/model.dart';

class Repository {
  final _baseUrl = 'https://3d7d-182-1-120-207.ap.ngrok.io';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/api/posting'));

      if (response.statusCode == 200) {
        print(response.body);
        var blog = articleFromJson(response.body);
        print(blog);
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String title, String content) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + '/api/posting'),
        body: {
          "teks": title,
        },
      );

      print(response.statusCode);
      if (response.statusCode == 20) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
