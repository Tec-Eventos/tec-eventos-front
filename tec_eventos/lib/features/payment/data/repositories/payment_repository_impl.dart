import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/features/payment/domain/entities/payment_method.dart';
import 'package:tec_eventos/features/payment/domain/entities/merchant_account.dart';
import 'package:tec_eventos/features/payment/domain/repositories/payment_repository.dart';

/// Implementação concreta do repositório de pagamentos com persistência em SharedPreferences.
class PaymentRepositoryImpl implements IPaymentRepository {
  static const String _methodsKey = 'saved_payment_methods';
  static const String _merchantPrefix = 'merchant_account_';

  final List<PaymentMethod> _defaultMethods = [
    const PaymentMethod(id: '1', name: 'MasterCard', lastFourDigits: '2109', type: PaymentMethodType.credit),
    const PaymentMethod(id: '2', name: 'NuBank', lastFourDigits: '3456', type: PaymentMethodType.debit),
  ];

  @override
  Future<List<PaymentMethod>> getSavedPaymentMethods() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_methodsKey);

    if (data == null) {
      // Inicializa com dados default
      final defaultList = _defaultMethods.map((m) => jsonEncode({
        'id': m.id,
        'name': m.name,
        'lastFourDigits': m.lastFourDigits,
        'type': m.type.name,
      })).toList();
      await prefs.setStringList(_methodsKey, defaultList);
      return _defaultMethods;
    }

    return data.map((item) {
      final map = jsonDecode(item) as Map<String, dynamic>;
      return PaymentMethod(
        id: map['id'],
        name: map['name'],
        lastFourDigits: map['lastFourDigits'],
        type: PaymentMethodType.values.firstWhere((e) => e.name == map['type']),
      );
    }).toList();
  }

  @override
  Future<void> addCreditCard({
    required String cardHolder,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final current = await getSavedPaymentMethods();

    final digits = cardNumber.replaceAll(RegExp(r'\D'), '');
    final lastFour = digits.length >= 4 ? digits.substring(digits.length - 4) : '0000';

    final newCard = PaymentMethod(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _detectCardBrand(cardNumber),
      lastFourDigits: lastFour,
      type: PaymentMethodType.credit,
    );

    final updated = [...current, newCard];
    final stringList = updated.map((m) => jsonEncode({
      'id': m.id,
      'name': m.name,
      'lastFourDigits': m.lastFourDigits,
      'type': m.type.name,
    })).toList();

    await prefs.setStringList(_methodsKey, stringList);
  }

  @override
  Future<MerchantAccount> getMerchantAccount(int cdInstituicao) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString('$_merchantPrefix$cdInstituicao');

    if (jsonStr == null) {
      return MerchantAccount.empty();
    }

    final map = jsonDecode(jsonStr) as Map<String, dynamic>;
    return MerchantAccount(
      titular: map['titular'] ?? '',
      cpfCnpj: map['cpfCnpj'] ?? '',
      banco: map['banco'] ?? '',
      tipoConta: map['tipoConta'] ?? 'Corrente',
      agencia: map['agencia'] ?? '',
      conta: map['conta'] ?? '',
    );
  }

  @override
  Future<void> saveMerchantAccount(int cdInstituicao, MerchantAccount account) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode({
      'titular': account.titular,
      'cpfCnpj': account.cpfCnpj,
      'banco': account.banco,
      'tipoConta': account.tipoConta,
      'agencia': account.agencia,
      'conta': account.conta,
    });
    await prefs.setString('$_merchantPrefix$cdInstituicao', jsonStr);
  }

  String _detectCardBrand(String number) {
    if (number.startsWith('4')) return 'Visa';
    if (number.startsWith('5')) return 'MasterCard';
    if (number.startsWith('3')) return 'American Express';
    return 'Nubank';
  }
}
