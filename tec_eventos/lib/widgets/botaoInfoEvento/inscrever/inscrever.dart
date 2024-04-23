import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/pagamento/metodospagamento.dart';
import 'package:tec_eventos/utils/providers/aluno_provider.dart';
import 'package:http/http.dart' as http;

class Inscrever extends StatelessWidget {
  const Inscrever({super.key, required this.cdEvento});
  final int cdEvento;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await inscrevendoAluno(context);
      },
      child: Container(
        height: 64,
        decoration: BoxDecoration(
            color: Cores.azul42A5F5,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Center(
          child: Text(
            "Inscrever-se",
            style: TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Cores.branco),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Future<bool?> inscrevendoAluno(BuildContext context) async {
    final cdevento = cdEvento;
    final rmAluno = Provider.of<AlunoProvider>(context, listen: false).rmAluno;
    final url = "http://192.168.1.112:8080/inscricaoEvento";

    final body = {
      "cd_evento": cdevento,
      "rm_aluno": rmAluno,
    };

    final response = await http.post(Uri.parse(url),
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Aluno inscrito! ${response.body}");
    } else {
      print("Alguma coisa deu errado");
    }
  }
}
