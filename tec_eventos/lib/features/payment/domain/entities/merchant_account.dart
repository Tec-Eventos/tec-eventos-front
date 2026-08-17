/// Representa a configuração de recebimento/conta bancária da Instituição de Ensino.
class MerchantAccount {
  final String titular;
  final String cpfCnpj;
  final String banco;
  final String tipoConta;
  final String agencia;
  final String conta;

  const MerchantAccount({
    required this.titular,
    required this.cpfCnpj,
    required this.banco,
    required this.tipoConta,
    required this.agencia,
    required this.conta,
  });

  /// Factory para criar uma conta vazia por padrão.
  factory MerchantAccount.empty() {
    return const MerchantAccount(
      titular: '',
      cpfCnpj: '',
      banco: '',
      tipoConta: 'Corrente',
      agencia: '',
      conta: '',
    );
  }
}
