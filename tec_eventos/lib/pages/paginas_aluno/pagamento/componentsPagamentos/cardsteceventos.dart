import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/features/payment/presentation/providers/payment_provider.dart';

/// Componente que exibe a tela de cadastro de novo cartão de crédito do Aluno.
class CardsComponent extends ConsumerStatefulWidget {
  /// Construtor padrão.
  const CardsComponent({Key? key}) : super(key: key);

  @override
  ConsumerState<CardsComponent> createState() => _CardsComponentState();
}

class _CardsComponentState extends ConsumerState<CardsComponent> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String bankName = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    if (creditCardModel == null) return;
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Future<void> _adicionarCartao() async {
    if (!formKey.currentState!.validate()) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.topSlide,
        title: "Inválido",
        desc: "Opss... Algo deu errado. Verifique os dados do cartão.",
        btnOkOnPress: () {},
        btnOkColor: const Color(0xff1565C0),
      ).show();
      return;
    }

    try {
      await ref.read(savedPaymentMethodsListProvider.notifier).addCard(
            cardHolder: cardHolderName,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cvv: cvvCode,
          );

      if (mounted) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          title: "Válido",
          desc: "Cartão adicionado com sucesso",
          btnOkText: "Confirmar",
          btnOkOnPress: () {
            Navigator.pop(context);
          },
          btnOkColor: const Color(0xff1565C0),
        ).show();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar cartão: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3F2FD),
      appBar: AppBar(
        backgroundColor: const Color(0xffE3F2FD),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 27,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Adicionar Cartão",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 41),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 230,
                      child: CreditCardWidget(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        showBackView: isCvvFocused,
                        bankName: bankName,
                        isHolderNameVisible: true,
                        cardBgColor: const Color(0xff1565C0),
                        chipColor: const Color(0xffFBD942),
                        obscureCardNumber: false,
                        obscureCardCvv: false,
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        onCreditCardWidgetChange: (brand) {},
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      width: MediaQuery.of(context).size.width / 1.10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.transparent, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: CreditCardForm(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        formKey: formKey,
                        inputConfiguration: const InputConfiguration(
                          cardNumberDecoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Cartão',
                            hintText: 'xxxx xxxx xxxx xxxx',
                          ),
                          expiryDateDecoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Data expedição',
                            hintText: 'xx/xx',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'xxx',
                          ),
                          cardHolderDecoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Nome',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(top: 18, bottom: 18, left: 90, right: 90),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: const Color(0xff1565C0),
                      ),
                      label: const Text(
                        "Adicionar novo cartão",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                      onPressed: _adicionarCartao,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
