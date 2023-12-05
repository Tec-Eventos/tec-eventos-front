import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class DataInput extends StatelessWidget {
  const DataInput({super.key, required this.controllerDataEvento});
  final TextEditingController controllerDataEvento;

  @override
  Widget build(BuildContext context) {
    var maskDate = MaskTextInputFormatter(mask: '##/##/####');

    return SizedBox(
      width: 100,
      height: 20,
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controllerDataEvento,
        style: TextStyle(
          fontFamily: Fontes.raleway,
          fontSize: 15,
          color: Cores.cinza6A6666,
          fontWeight: FontWeight.bold,
        ),
        inputFormatters: [maskDate],
        decoration: InputDecoration(
          hintText: "Data",
          hintStyle: TextStyle(
              fontFamily: Fontes.raleway,
              fontSize: 15,
              color: Cores.cinza6A6666,
              fontWeight: FontWeight.bold),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Informe a data do evento";
          }
        },
      ),
    );
  }
}
