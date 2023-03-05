import 'dart:convert';

import 'package:dio/dio.dart';

class ApiServices {
  var dio = Dio();
  var url = 'http://localhost:3000/shortlinks';

  addLinkRequest(body) async {
    try {
      var response = await dio.post(url, data: body);
      print(response.data);
      return response.statusCode;
    } catch (e) {
      print(e);
    }
  }

  getAllLinks() async {
    try {
      final response = await Dio().get(url);
      final data = response.data;
      // print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }
}
