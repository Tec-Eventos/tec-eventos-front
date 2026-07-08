import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/payment/domain/entities/merchant_account.dart';
import 'package:tec_eventos/features/payment/presentation/providers/payment_provider.dart';

/// Tela para a Instituição configurar suas chaves/dados de recebimento de pagamentos.
class PageConfigurarPagamento extends ConsumerWidget {
  const PageConfigurarPagamento({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.branco,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Cores.preto,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "PAGAMENTO",
          style: TextStyle(
            fontFamily: Fontes.raleway,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Cores.preto,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        scrollDirection: Axis.vertical,
        children: [
          const Text(
            "Informações da conta bancária",
            style: TextStyle(
              fontFamily: Fontes.ralewayBold,
              fontSize: 20,
              color: Cores.preto,
            ),
          ),
          const SizedBox(height: 10),
          const FormularioPagamento(),
        ],
      ),
    );
  }
}

class FormularioPagamento extends ConsumerStatefulWidget {
  const FormularioPagamento({super.key});

  @override
  ConsumerState<FormularioPagamento> createState() => _FormularioPagamentoState();
}

class _FormularioPagamentoState extends ConsumerState<FormularioPagamento> {
  final _formKey = GlobalKey<FormState>();

  final _titularController = TextEditingController();
  final _cpfCnpjController = TextEditingController();
  final _bancoController = TextEditingController();
  final _agenciaController = TextEditingController();
  final _contaController = TextEditingController();

  String _tipoConta = 'Corrente';
  bool _initialized = false;

  @override
  void dispose() {
    _titularController.dispose();
    _cpfCnpjController.dispose();
    _bancoController.dispose();
    _agenciaController.dispose();
    _contaController.dispose();
    super.dispose();
  }

  Future<void> _salvar() async {
    if (!_formKey.currentState!.validate()) return;

    final account = MerchantAccount(
      titular: _titularController.text.trim(),
      cpfCnpj: _cpfCnpjController.text.trim(),
      banco: _bancoController.text.trim(),
      tipoConta: _tipoConta,
      agencia: _agenciaController.text.trim(),
      conta: _contaController.text.trim(),
    );

    try {
      await ref.read(merchantAccountStateProvider.notifier).saveAccount(account);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Configuração de recebimento salva com sucesso!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar dados: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: Fontes.inter,
            color: Cores.preto,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: Fontes.inter,
            color: Cores.cinza,
            fontSize: 14,
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Cores.preto),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Cores.preto),
          ),
        ),
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accountState = ref.watch(merchantAccountStateProvider);

    // Inicializa os text controllers com os dados salvos do provider assim que disponíveis
    accountState.whenData((account) {
      if (!_initialized) {
        _titularController.text = account.titular;
        _cpfCnpjController.text = account.cpfCnpj;
        _bancoController.text = account.banco;
        _agenciaController.text = account.agencia;
        _contaController.text = account.conta;
        _tipoConta = account.tipoConta.isNotEmpty ? account.tipoConta : 'Corrente';
        _initialized = true;
      }
    });

    final isLoading = accountState is AsyncLoading;

    return accountState.when(
      data: (_) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildField(
                controller: _titularController,
                label: "Titular da Conta",
                hint: "Nome do titular da conta",
                validator: (val) => val == null || val.isEmpty ? "Campo obrigatório" : null,
              ),
              _buildField(
                controller: _cpfCnpjController,
                label: "CPF ou CNPJ",
                hint: "Insira o documento vinculado à conta",
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? "Campo obrigatório" : null,
              ),
              _buildField(
                controller: _bancoController,
                label: "Banco",
                hint: "Nome ou número do banco",
                validator: (val) => val == null || val.isEmpty ? "Campo obrigatório" : null,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: DropdownButtonFormField<String>(
                  value: _tipoConta,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    labelText: "Tipo de Conta",
                    labelStyle: const TextStyle(
                      fontFamily: Fontes.inter,
                      color: Cores.preto,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Cores.preto),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Corrente', child: Text('Conta Corrente')),
                    DropdownMenuItem(value: 'Poupança', child: Text('Conta Poupança')),
                  ],
                  onChanged: isLoading
                      ? null
                      : (val) {
                          if (val != null) {
                            setState(() {
                              _tipoConta = val;
                            });
                          }
                        },
                ),
              ),
              _buildField(
                controller: _agenciaController,
                label: "Agência",
                hint: "Número da agência",
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? "Campo obrigatório" : null,
              ),
              _buildField(
                controller: _contaController,
                label: "Conta (com Dígito)",
                hint: "Número da conta bancária",
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: isLoading ? null : _salvar,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Cores.azul42A5F5,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : const Text(
                        "Salvar Configuração",
                        style: TextStyle(
                          color: Cores.branco,
                          fontFamily: Fontes.ralewayBold,
                          fontSize: 18,
                        ),
                      ),
              )
            ],
          ),
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.0),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) => Center(
        child: Text('Erro ao carregar dados bancários: $error', style: const TextStyle(color: Colors.red)),
      ),
    );
  }
}
