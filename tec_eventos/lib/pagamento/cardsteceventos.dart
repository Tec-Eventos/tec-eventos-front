import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

import 'package:tec_eventos/pagamento/metodospagamento.dart';



class CardsComponent extends StatefulWidget {
  const CardsComponent({Key? key}) : super(key: key);

  @override
  State<CardsComponent> createState() => _CardsComponentState();
}


class _CardsComponentState extends State<CardsComponent> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String bankName = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3F2FD),
      appBar: AppBar(
        backgroundColor: Color(0xffE3F2FD),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 27,),
          onPressed: () {
            Navigator.pop(context);
          },),
        title: Text("Adicionar Cartão", style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 41,),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 230,
                      child:
                      CreditCardWidget(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        showBackView: isCvvFocused,
                        bankName: bankName,
                        isHolderNameVisible: true,
                        cardBgColor: Color(0xff1565C0),
                        chipColor: Color(0xffFBD942),
                        obscureCardNumber: false,
                        obscureCardCvv: false,
                        textStyle: TextStyle(color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        onCreditCardWidgetChange: (CreditCardBrand) {},
                      ),

                    ),
                    SizedBox(height: 30,),

                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                      child: CreditCardForm(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        themeColor: Colors.white,
                        formKey: formKey,
                        cardNumberDecoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Cartão',
                            hintText: 'xxxx xxxx xxxx xxxx'
                        ),
                        expiryDateDecoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Data expedição',
                            hintText: 'xx/xx'
                        ),
                        cvvCodeDecoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'xxx'
                        ),
                        cardHolderDecoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Nome',
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            top: 18, bottom: 18, left: 90, right: 90),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        primary: Color(0xff1565C0),
                      ),
                      label: Text("Adicionar novo cartão",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),),
                      onPressed: ()  {
                        if (formKey.currentState!.validate()) {
                          String cardNumberValue = cardNumber;
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.topSlide,
                            title: "Válido",
                            btnOkText: "Confirmar",
                            desc: "Cartão adicionado com sucesso",
                            btnOkOnPress: () {

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => MetodosPagamento()),);
                            },
                            btnOkColor: Color(0xff1565C0),

                          ).show();
                        } else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.topSlide,
                            title: "Inválido",
                            desc: "Opss... Algo deu errado",
                            btnOkOnPress: () {},
                            btnCancelOnPress: () {},
                            btnOkColor: Color(0xff1565C0),
                          ).show();
                        }
                      },
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

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }


}
