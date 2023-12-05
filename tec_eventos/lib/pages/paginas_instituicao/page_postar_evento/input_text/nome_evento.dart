import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class NomeEventoInput extends StatelessWidget {
  const NomeEventoInput({super.key, required this.controllerNomeEvento});
  final TextEditingController controllerNomeEvento;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controllerNomeEvento,
      style: TextStyle(
          fontFamily: Fontes.raleway,
          fontSize: 20,
          color: Cores.preto,
          fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Nome do evento",
        hintStyle: TextStyle(
            fontFamily: Fontes.raleway,
            fontSize: 20,
            color: Cores.preto,
            fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Informe o nome do evento";
        }
      },
    );
  }
}
