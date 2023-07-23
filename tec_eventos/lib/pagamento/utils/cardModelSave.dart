import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CreditCardData {
  String cardNumber;
  String cardHolderName;

  CreditCardData({
    required this.cardNumber,
    required this.cardHolderName,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
    };
  }

  factory CreditCardData.fromJson(Map<String, dynamic> json) {
    return CreditCardData(
      cardNumber: json['cardNumber'],
      cardHolderName: json['cardHolderName'],
    );
  }

  Future<void> saveCreditCardData(List<CreditCardData> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cardsJsonList = data.map((card) => json.encode(card.toJson())).toList();
    prefs.setStringList('creditCards', cardsJsonList);
  }

  Future<List<CreditCardData>> getCreditCardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cardsJsonList = prefs.getStringList('creditCards');
    if (cardsJsonList != null) {
      List<CreditCardData> creditCards = cardsJsonList.map((json) => CreditCardData.fromJson(jsonDecode(json))).toList();
      return creditCards;
    }
    return [];
  }
}
