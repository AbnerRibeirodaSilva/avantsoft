class RegisterSaleRequestDto {
  final String clientId;
  final double value;
  final String date;

  RegisterSaleRequestDto({
    required this.clientId,
    required this.value,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {'clientId': clientId, 'value': value, 'date': date};
  }
}
