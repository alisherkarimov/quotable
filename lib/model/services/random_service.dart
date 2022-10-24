import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:quotable/core/base_service.dart';

import '../../core/app_exception.dart';

class RandomService extends BaseService {
  dynamic responseJson;

  @override
  Future getResponse(String url) async {
    try {
      final response = await http.get(Uri.parse(baseUri + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("Internet error");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 401:
        throw UnauthorizedException(response.statusCode.toString());
      case 404:
        throw NotFoundException(response.statusCode.toString());
      default:
        throw Exception(response.statusCode.toString());
    }
  }
}
