class LoginResponseModel {
  String? token;
  dynamic? error;

  LoginResponseModel({
    this.error,
    this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json['access_token'] ?? '', error: json['errors'] ?? '');
  }
}

class LoginRequestModel {
  String? userName;
  String? password;
  String? server_key;

  LoginRequestModel({
    this.password,
    this.userName,
    this.server_key,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': userName,
      'password': password,
      'server_key': '1eca16c1127fcaf8266a3ae56dffb540f5eaac9f-88'
          '9fe0e508bf0365111cc95114e29263-88061744',
    };
    return map;
  }
}
