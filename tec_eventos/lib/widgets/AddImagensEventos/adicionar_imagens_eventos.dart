import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';

class AdicionarImagemEvento extends StatefulWidget {
  const AdicionarImagemEvento({super.key});

  @override
  State<AdicionarImagemEvento> createState() => _AdicionarImagemEventoState();
}

class _AdicionarImagemEventoState extends State<AdicionarImagemEvento> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Cores.cinzaD8D7D7),
        child: Icon(
          Icons.add,
          size: 61,
          color: Cores.preto,
        ),
      ),
    );
  }
}
