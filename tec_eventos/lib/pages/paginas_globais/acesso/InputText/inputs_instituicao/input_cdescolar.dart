import 'package:flutter/material.dart';

class InputTextCdEscolar extends StatelessWidget {
  const InputTextCdEscolar({super.key, required this.controllerCdEscolar});

  final TextEditingController controllerCdEscolar;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controllerCdEscolar,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.content_paste_rounded),
        isDense: true,
        labelText: "Código Escolar",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
