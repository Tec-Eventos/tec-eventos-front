import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_configurar_pagamento/input_text_pagamento/input_text_pagamento.dart';

class PageConfigurarPagamento extends StatelessWidget {
  const PageConfigurarPagamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.branco,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Cores.preto,
              size: 30,
            )),
        centerTitle: true,
        title: Text(
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
          Text(
            "Informações da conta",
            style: TextStyle(
              fontFamily: Fontes.ralewayBold,
              fontSize: 20,
              color: Cores.preto,
            ),
          ),
          const FormularioPagamento()
        ],
      ),
    );
  }
}

//FORMULARIO PARA CONFIGURAR O PAGAMENTO
class FormularioPagamento extends StatefulWidget {
  const FormularioPagamento({super.key});

  @override
  State<FormularioPagamento> createState() => _FormularioPagamentoState();
}

class _FormularioPagamentoState extends State<FormularioPagamento> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputTextPagamento(),
          const InputTextPagamento(),
          const InputTextPagamento(),
          const InputTextWithDropDown(),
          const InputTextWithDropDown(),
          const InputTextPagamento(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Cores.azul42A5F5,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    color: Cores.branco,
                    fontFamily: Fontes.ralewayBold,
                    fontSize: 20,
                  ),
                )),
          )
        ],
      ),
    );
  }
}



