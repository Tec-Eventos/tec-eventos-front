import 'package:flutter/material.dart';

emailValid(value) {
  bool emailValid = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value!);

  if (value.isEmpty) {
    return "Coloque o email";
  } else if (!emailValid) {
    return "Coloque um email válido";
  }
}

passwordValid(value, TextEditingController controllerSenha) {
  if (value!.isEmpty) {
    return "Coloque a senha";
  } else if (controllerSenha.text.length < 6) {
    return "Senha curta, coloque acima de 6 caracteres";
  }
}

// userValid(value) {
//   if (value!.isEmpty) {
//     return "Coloque um usuário";
//   }
// }

submitFormValid() {}
