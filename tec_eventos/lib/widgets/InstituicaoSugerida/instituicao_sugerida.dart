import 'package:flutter/material.dart';



class InstituicaoSugerida extends StatefulWidget {
  const InstituicaoSugerida({super.key, required this.imagem});

  final String imagem;
  @override
  State<InstituicaoSugerida> createState() => _InstituicaoSugeridaState();
}

class _InstituicaoSugeridaState extends State<InstituicaoSugerida> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 10),
      child: Image.asset(
        widget.imagem,
        fit: BoxFit.fill,
        height: 55,
      ),
    );
  }
}