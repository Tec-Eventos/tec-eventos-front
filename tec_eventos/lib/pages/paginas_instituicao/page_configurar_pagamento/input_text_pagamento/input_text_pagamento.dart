import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';



class InputTextPagamento extends StatefulWidget {
  const InputTextPagamento({super.key});

  @override
  State<InputTextPagamento> createState() => _InputTextPagamentoState();
}

class _InputTextPagamentoState extends State<InputTextPagamento> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          labelText: "Conta",
          labelStyle: TextStyle(
            fontFamily: Fontes.inter,
            color: Cores.preto,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          hintText: "",
          hintStyle: TextStyle(
            fontFamily: Fontes.inter,
            color: Cores.cinza,
            fontSize: 15,
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Cores.preto)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Cores.preto)),
        ),
      ),
    );
  }
}

class InputTextWithDropDown extends StatefulWidget {
  const InputTextWithDropDown({super.key});

  @override
  State<InputTextWithDropDown> createState() => _InputTextWithDropDownState();
}

class _InputTextWithDropDownState extends State<InputTextWithDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Cores.preto,
            ),
          ),
          labelText: "Conta",
          labelStyle: TextStyle(
            fontFamily: Fontes.inter,
            color: Cores.preto,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          hintText: "Tipo de conta bancária",
          hintStyle: TextStyle(
            fontFamily: Fontes.inter,
            color: Cores.cinza,
            fontSize: 15,
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Cores.preto)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Cores.preto)),
        ),
      ),
    );
  }
}
