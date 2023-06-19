import 'dart:convert';
import 'dart:io';

import 'package:api_integrat/infrastruture/exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class BaseApiHelper {
  Future<dynamic> get(BuildContext context, {required String endPoint}) async {
    var responseJson;
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com$endPoint"));
      responseJson = _returnResponse(response);
    } on SocketException catch (e) {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
