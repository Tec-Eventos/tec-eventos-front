import 'package:flutter/material.dart';
import 'package:tec_eventos/widgets/InputText/validations/validations_info.dart';

class InputTextEmail extends StatelessWidget {
  const InputTextEmail({super.key, required this.controllerEmail});

  final TextEditingController controllerEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controllerEmail,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        isDense: true,
        labelText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        //   contentPadding: const EdgeInsets.only(
        //       top: 18.0, right: 20, bottom: 18.0, left: 40),
        // ),
      ),
      validator: (email) {
        return emailValid(email);
      },
    );
  }
}

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
              passToggle ? Icons.visibility : Icons.visibility_off_outlined),
        ),
      ),
      validator: (senha) {
        return passwordValid(senha, widget.controllerSenha);
      },
    );
  }
}

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
        labelText: "Usuário",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
