import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputTextTelefone extends StatelessWidget {
  const InputTextTelefone({super.key, required this.controllerTel});

  final TextEditingController controllerTel;

  @override
  Widget build(BuildContext context) {
    var masktelefone = MaskTextInputFormatter(mask: '(##) #####-####');

    return TextFormField(
      keyboardType: TextInputType.phone,
      inputFormatters: [masktelefone],
      controller: controllerTel,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        isDense: true,
        labelText: "Telefone",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        //   contentPadding: const EdgeInsets.only(
        //       top: 18.0, right: 20, bottom: 18.0, left: 40),
        // ),
      ),
      validator: (telefone) {
        if (telefone!.isEmpty) {
          return 'Coloque um número de telefone';
        } else if (telefone.length != 10) {
          return 'Número inválido';
        } else if (!RegExp(r'^[0-9]+$').hasMatch(telefone)) {
          return "Informe apenas dígitos";
        }

        return null;
      },
    );
  }
}
