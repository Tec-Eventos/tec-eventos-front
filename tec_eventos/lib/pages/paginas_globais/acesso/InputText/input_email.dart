import 'package:flutter/material.dart';

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
        labelText: "E-mail",
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
