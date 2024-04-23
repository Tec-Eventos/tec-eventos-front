import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class HoraInput extends StatelessWidget {
  const HoraInput({super.key, required this.controllerHorario});

  final TextEditingController controllerHorario;
  @override
  Widget build(BuildContext context) {
    var maskHora = MaskTextInputFormatter(mask: '##h##');
    return SizedBox(
      width: 100,
      height: 20,
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controllerHorario,
        style: TextStyle(
            fontFamily: Fontes.raleway,
            fontSize: 15,
            color: Cores.cinza6A6666,
            fontWeight: FontWeight.bold),
        inputFormatters: [maskHora],
        decoration: InputDecoration(
          hintText: "Horário",
          hintStyle: TextStyle(
              fontFamily: Fontes.raleway,
              fontSize: 15,
              color: Cores.cinza6A6666,
              fontWeight: FontWeight.bold),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Informe o horário do evento";
          }
        },
      ),
    );
  }
}
