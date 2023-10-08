import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';

class CaixaTextoIngressos extends StatefulWidget {
  const CaixaTextoIngressos({super.key});

  @override
  State<CaixaTextoIngressos> createState() => _CaixaTextoIngressosState();
}

class _CaixaTextoIngressosState extends State<CaixaTextoIngressos> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerIngressos = TextEditingController();

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
        controller: controllerIngressos,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Informe a limitação de ingressos",
        ),
      ),
    );
  }
}
