enum PaymentMethodType { credit, debit, pix, other }

/// Representa uma opção de pagamento salva pelo aluno.
class PaymentMethod {
  final String id;
  final String name; // ex: 'Nubank', 'MasterCard'
  final String lastFourDigits;
  final PaymentMethodType type;

  const PaymentMethod({
    required this.id,
    required this.name,
    required this.lastFourDigits,
    required this.type,
  });
}
