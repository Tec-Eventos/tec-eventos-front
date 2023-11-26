import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';

class InputTextPassword extends StatefulWidget {
  const InputTextPassword({super.key, required this.controllerSenha});

  final TextEditingController controllerSenha;

  @override
  State<InputTextPassword> createState() => _InputTextPasswordState();
}

class _InputTextPasswordState extends State<InputTextPassword> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controllerSenha,
      obscureText: passToggle,
      decoration: InputDecoration(
        isDense: true,
        labelText: "Senha",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        prefixIcon: const Icon(Icons.lock),
        suffix: InkWell(
          onTap: () {
            setState(() {
              passToggle = !passToggle;
            });
          },
          child: Icon(
            passToggle
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Cores.azul47BBEC,
          ),
        ),
      ),
      validator: (senha) {
        return passwordValid(senha, widget.controllerSenha);
      },
    );
  }
}

passwordValid(value, TextEditingController controllerSenha) {
  if (value!.isEmpty) {
    return "Coloque a senha";
  } else if (controllerSenha.text.length < 6) {
    return "Senha curta, coloque acima de 6 caracteres";
  }
}
