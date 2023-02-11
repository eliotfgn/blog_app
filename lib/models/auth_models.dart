class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);

  Map<String, String> toJson() {
    return {
      'strategy': 'local',
      'email': email,
      'password': password,
    };
  }
}

class LoginResponse {
  String accessToken;
  String userId;
  String email;
  String username;

  LoginResponse({required this.accessToken, required this.userId, required this.username, required this.email,});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json['accessToken'],
        userId: json['user']['id'],
        email: json['user']['email'],
        username: json['user']['username'],
      );
}
