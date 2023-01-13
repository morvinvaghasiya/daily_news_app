import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_baseurl.dart';
import '../../utils/custommethod.dart';
import '../modal/NewsData.dart';

class Apiservice {
  static http.Client client = http.Client();
  Future<List<NewsData>?> getResponce(String type, BuildContext context) async {
    try {
      String url = Apibaseurl.baseurl + type;
      final responce = await client.get(Uri.parse(url));
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        NewsList data = NewsList.fromJson(jsonDecode(responce.body));
        List<NewsData> list = data.newslist;
        return list;
      } else {
        CustomMethod().showSnackBar(
            context: context,
            content:
                (jsonDecode(responce.body)["error"]) ?? "Something Happen");
        return null;
      }
    } catch (e) {
      CustomMethod().showSnackBar(context: context, content: "Error is $e");
    }
  }
}
