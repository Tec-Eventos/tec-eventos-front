import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputTextCEP extends StatelessWidget {
  const InputTextCEP({super.key, required this.controllerCEP});

  final TextEditingController controllerCEP;

  @override
  Widget build(BuildContext context) {
    var maskcep = MaskTextInputFormatter(mask: '#####-###');

    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [maskcep],
      controller: controllerCEP,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.location_on_outlined),
        isDense: true,
        labelText: "CEP",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        //   contentPadding: const EdgeInsets.only(
        //       top: 18.0, right: 20, bottom: 18.0, left: 40),
        // ),
      ),
      validator: (cep) {
        if (cep!.isEmpty) {
          return "Coloque um CEP";
        } else if (cep.length < 9) {
          return "Esse CEP não contém 9 dígitos";
        } else if (!RegExp(r'^[0-9]+$').hasMatch(cep)) {
          return "Informe apenas dígitos";
        }
        return null;
      },
    );
  }
}
