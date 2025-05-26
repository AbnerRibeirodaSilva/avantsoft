abstract class HomeDatasource {
  Future<Map<String, dynamic>> getClientList();
  Future<Map<String, dynamic>> registerClient(
    String name,
    String email,
    String birthdate,
  );
  Future<Map<String, dynamic>> registerSale(
    String clientId,
    double value,
    String date,
  );
  Future<Map<String, dynamic>> getHighlights();
  Future<Map<String, dynamic>> getDailySales();
}
