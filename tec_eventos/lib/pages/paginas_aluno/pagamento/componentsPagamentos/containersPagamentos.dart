import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/features/payment/domain/entities/payment_method.dart';
import 'package:tec_eventos/features/payment/presentation/providers/payment_provider.dart';
import 'package:tec_eventos/pages/paginas_aluno/pagamento/componentsPagamentos/cardsteceventos.dart';
import 'package:tec_eventos/pages/paginas_aluno/pagamento/componentsPagamentos/precos.dart';

/// Exibe a lista de cartões de Crédito/Débito salvos do Aluno de forma dinâmica.
class CardsGeral extends ConsumerWidget {
  const CardsGeral({Key? key}) : super(key: key);

  String _getBankLogo(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('mastercard')) {
      return 'assets/bancos_pagamento/logoMasterCard.png';
    }
    if (lower.contains('nubank')) {
      return 'assets/bancos_pagamento/logoNuBank.png';
    }
    return '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final methodsAsync = ref.watch(savedPaymentMethodsListProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.10,
                decoration: BoxDecoration(
                  color: const Color(0xffE9E9E9),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CardsComponent()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 33),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: const Color(0xffE9E9E9),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 72),
                      const Text(
                        "Adicionar cartão",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 26),
            methodsAsync.when(
              data: (methods) {
                final cardMethods = methods.where((m) => m.type == PaymentMethodType.credit || m.type == PaymentMethodType.debit).toList();

                if (cardMethods.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('Nenhum cartão cadastrado.'),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cardMethods.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 26),
                  itemBuilder: (context, index) {
                    final method = cardMethods[index];
                    final logo = _getBankLogo(method.name);

                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffE9E9E9),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        width: MediaQuery.of(context).size.width / 1.10,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 29),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: const Color(0xffE9E9E9),
                          ),
                          onPressed: () {},
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    method.name,
                                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: logo.isNotEmpty
                                        ? Image.asset(logo)
                                        : const Icon(Icons.credit_card, color: Colors.black),
                                  ),
                                  Text(
                                    '**** **** **** ${method.lastFourDigits}',
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.black),
                                  ),
                                  const Icon(Icons.check_circle_outline, color: Color(0xff1565C0))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Text('Erro ao carregar cartões: $err'),
            ),
            const SizedBox(height: 75),
            const PrecosComponent(),
          ],
        ),
      ),
    );
  }
}

/// Exibe o método de pagamento Pix.
class SearchBarPix extends StatelessWidget {
  const SearchBarPix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width / 1.10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Insira a chave pix aqui",
                  hintStyle: TextStyle(
                    color: Color(0xff837D7D),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.10,
                child: const Text(
                  "Pagamentos Recentes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
            ],
          ),
          const SizedBox(height: 17),
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 21),
                  margin: const EdgeInsets.symmetric(horizontal: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/UnivemIMG.png', height: 24),
                      const Text(
                        "R\$120,00",
                        style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 75),
          const PrecosComponent(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

/// Exibe opções alternativas de pagamento.
class ContainerTres extends StatelessWidget {
  const ContainerTres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: const Center(
        child: Text(
          'Outras formas de pagamento disponíveis em breve (Boleto Bancário, PicPay).',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}