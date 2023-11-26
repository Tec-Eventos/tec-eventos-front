import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';

class InputTextTipoInstituicao extends StatefulWidget {
  const InputTextTipoInstituicao(
      {super.key, required this.controllerTipoInstituicao});
  final TextEditingController controllerTipoInstituicao;
  @override
  State<InputTextTipoInstituicao> createState() =>
      _InputTextTipoInstituicaoState();
}

class _InputTextTipoInstituicaoState extends State<InputTextTipoInstituicao> {
  final List<String> _escolas = ["Universidade", "Escola", "Faculdade"];
  String? _selectedEscolas;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DropdownButtonFormField(
        value: _selectedEscolas,
        items: _escolas
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (val) {
          setState(() {
            _selectedEscolas = val as String;
          });
        },
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Cores.azul47BBEC,
        ),
        dropdownColor: Cores.brancoCinzento,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.school_sharp),
            labelText: "Tipo de instituição",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(70))),
      ),
    );
  }
}
