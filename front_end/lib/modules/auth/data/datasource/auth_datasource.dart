abstract class AuthDatasource {
  Future<Map<String, dynamic>> signIn(String email, String password);
}
