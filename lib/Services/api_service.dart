import 'dart:convert';

import 'package:kpie_test/Model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<LoginResponseModel> login(LoginRequestModel, requestModel) async {
    String url = 'https://fashionbiz.org/api/auth';

    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200) {
      print('logged in');
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
