import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputTextCNPJ extends StatelessWidget {
  const InputTextCNPJ({super.key, required this.controllerCNPJ});

  final TextEditingController controllerCNPJ;

  @override
  Widget build(BuildContext context) {
    var maskCNPJ = MaskTextInputFormatter(mask: '##.###.###/####-##');

    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [maskCNPJ],
      controller: controllerCNPJ,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.badge_outlined),
        isDense: true,
        labelText: "CNPJ",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        //   contentPadding: const EdgeInsets.only(
        //       top: 18.0, right: 20, bottom: 18.0, left: 40),
        // ),
      ),
      // validator: () {
      // },
    );
  }
}
