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
        return passworValidLogin(senha, widget.controllerSenha);
      },
    );
  }
}

class InputTextSenhaCadastro extends StatefulWidget {
  const InputTextSenhaCadastro(
      {super.key,
      required this.controllerSenha,
      required this.controllerConfirmSenha});

  final TextEditingController controllerSenha;
  final TextEditingController controllerConfirmSenha;

  @override
  State<InputTextSenhaCadastro> createState() => _InputTextSenhaCadastroState();
}

class _InputTextSenhaCadastroState extends State<InputTextSenhaCadastro> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: widget.controllerSenha,
              obscureText: passToggle,
              decoration: InputDecoration(
                isDense: true,
                labelText: "Senha",
                hintText: "Ex. Ga12_21",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: widget.controllerConfirmSenha,
            obscureText: passToggle,
            decoration: InputDecoration(
              isDense: true,
              labelText: "Confirmar senha",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
              return confirmPasswordValid(
                  senha, widget.controllerSenha, widget.controllerConfirmSenha);
            },
          ),
        ),
      ],
    );
  }
}

passworValidLogin(value, TextEditingController controllerSenha) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_-]).{8,}$';
  RegExp regExp = RegExp(pattern);

  if (value!.isEmpty) {
    return "Coloque a senha";
  } else if (controllerSenha.text.length < 6) {
    return "Senha curta, coloque acima de 6 caracteres";
  } else if (!regExp.hasMatch(value)) {
    return "Senha inválida";
  }
}

passwordValid(value, TextEditingController controllerSenha) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_-]).{8,}$';
  RegExp regExp = RegExp(pattern);

  if (value!.isEmpty) {
    return "Coloque a senha";
  } else if (controllerSenha.text.length < 6) {
    return "Senha curta, coloque acima de 6 caracteres";
  } else if (!regExp.hasMatch(value)) {
    return "Senha fraca";
  }
}

confirmPasswordValid(value, TextEditingController controllerSenha,
    TextEditingController controllerConfirmSenha) {
  if (value!.isEmpty) {
    return "Coloque a senha";
  } else if (controllerSenha.text != controllerConfirmSenha.text) {
    return "Senhas incompatíveis";
  }
}
