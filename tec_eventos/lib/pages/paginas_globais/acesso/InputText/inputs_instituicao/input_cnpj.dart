import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/forms/cadastro/cadastro_instituicao.dart';

class InputTextCNPJ extends StatefulWidget {
  const InputTextCNPJ({super.key, required this.controllerCNPJ});

  final TextEditingController controllerCNPJ;

  @override
  State<InputTextCNPJ> createState() => _InputTextCNPJState();
}

class _InputTextCNPJState extends State<InputTextCNPJ> {
  @override
  Widget build(BuildContext context) {
    var maskCNPJ = MaskTextInputFormatter(mask: '##.###.###/####-##');

    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [maskCNPJ],
      controller: widget.controllerCNPJ,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.badge_outlined),
        isDense: true,
        labelText: "CNPJ",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        //   contentPadding: const EdgeInsets.only(
        //       top: 18.0, right: 20, bottom: 18.0, left: 40),
        // ),
      ),
      validator: (cnpj) {
        String cnpj =
            widget.controllerCNPJ.text.replaceAll(RegExp(r'[./]'), '');
        if (CNPJValidator.isValid(cnpj) == false) {
          return "CNPJ inválido";
        }
        return null;
      },
    );
  }
}
