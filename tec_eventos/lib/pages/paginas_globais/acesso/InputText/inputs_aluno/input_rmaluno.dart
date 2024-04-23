import 'package:flutter/material.dart';

class InputTextRmAluno extends StatefulWidget {
  const InputTextRmAluno({super.key, required this.controllerRmAluno});

  final TextEditingController controllerRmAluno;

  @override
  State<InputTextRmAluno> createState() => _InputTextRmAlunoState();
}

class _InputTextRmAlunoState extends State<InputTextRmAluno> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: widget.controllerRmAluno,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.school_outlined),
        isDense: true,
        labelText: "RM",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
      validator: (rm) {
        if (rm!.isEmpty) {
          return "Informe o seu RM";
        } else if (!RegExp(r'^[0-9]+$').hasMatch(rm)) {
          return "Informe apenas dígitos";
        } else if (rm.length < 5) {
          return "RM inválido";
        }
      },
    );
  }
}
