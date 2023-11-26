import 'package:flutter/material.dart';

class InputTextInstituicao extends StatelessWidget {
  const InputTextInstituicao({super.key, required this.controllerInstituicao});

  final TextEditingController controllerInstituicao;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controllerInstituicao,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.school_outlined),
        isDense: true,
        labelText: "Instituição",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
