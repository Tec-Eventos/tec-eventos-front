import 'package:flutter/material.dart';

class InputTextName extends StatelessWidget {
  const InputTextName({super.key, required this.controllerUser});

  final TextEditingController controllerUser;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controllerUser,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person_outline_outlined),
        isDense: true,
        labelText: "Nome",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
