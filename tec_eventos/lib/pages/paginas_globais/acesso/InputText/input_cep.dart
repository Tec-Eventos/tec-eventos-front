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
      // inputFormatters: [maskcep],
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
      // validator: () {
      // },
    );
  }
}
