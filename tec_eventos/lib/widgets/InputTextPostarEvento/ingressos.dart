import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class CaixaTextoIngressos extends StatefulWidget {
  const CaixaTextoIngressos({super.key, required this.controllerIngressos});

  final TextEditingController controllerIngressos;
  @override
  State<CaixaTextoIngressos> createState() => _CaixaTextoIngressosState();
}

class _CaixaTextoIngressosState extends State<CaixaTextoIngressos> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 40,
        width: 40,
        child: CircleAvatar(
          backgroundColor: Cores.azul42A5F5,
          child: Icon(
            Icons.chair_outlined,
            color: Cores.branco,
            size: 20,
          ),
        ),
      ),
      title: TextFormField(
        keyboardType: TextInputType.number,
        controller: widget.controllerIngressos,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Informe a limitação de ingressos",
          hintStyle:
              TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.w600),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Informe a quantidade de ingressos";
          }
        },
      ),
    );
  }
}
