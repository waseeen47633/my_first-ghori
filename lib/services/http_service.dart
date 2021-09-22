import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:untitled2/model/model_post.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class HttpService {
  static var time_out = const Duration(seconds: 120);
  static var client = http.Client();
  static String url = "https://jsonplaceholder.typicode.com/posts";


  static void insertIntoApi() async {
    try {
      final response = await client.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'title': "new title",
            'body': "new title body",
            'userId': "44529"
          }));

      print(response.body);
    } catch (er) {
      throw Exception(er);
    }
  }
static   String log = "HttpServiceLog";

  static Future<List<Modelposts>> GetAllPost() async {
    try {
     // Map<String, String> params_header = {'ISO': "PAK"};
       //Map<String, String> params_body = {'city_id': "22", 'city_id': "12"};

      Response response = await client.get(Uri.parse(url)).timeout(time_out);

      if (response.statusCode == 200) {



      } else if (response.statusCode == 401) {
        String jsonString = response.body;
        print("$log body : " + jsonString);

        final modelPost = modelpostsFromJson(jsonString);

        print("$log Status 401, please try again");

        return modelPost;
      } else {
        print("$log Network error, Please try again");
        // /return ModelCategoryOpen(status: 501, message: "Network error, Please try again");
      }
    } on TimeoutException catch (_) {
      print("$log Time out error, Please try again");
    } on SocketException {
      print("$log You are not connected to internet");
    } catch (ex) {
      print("$log Exception $ex");
    }
  }
}
