class Endpoints {
  String baseUrl;

  Endpoints(this.baseUrl);

  String login() => '/auth/login';
  String posts() => '/posts';
}
