import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

import 'package:tec_eventos/pages/paginas_globais/acesso/forms/cadastro/cadastro_aluno.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/forms/cadastro/cadastro_instituicao.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formfield = GlobalKey<FormState>();
  List<String> formularios = ['Aluno', 'Instituição'];

  String? selectedForm = 'Aluno';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.branco,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            './assets/t!e_logo.png',
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Cadastre-se',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Fontes.inter,
              fontWeight: FontWeight.w500,
              color: Cores.azul47BBEC,
              fontSize: 28,
            ),
          ),
          Center(
            child: SizedBox(
              width: 200,
              child: DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(20),
                elevation: 0,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Cores.azul47BBEC,
                ),
                value: selectedForm,
                items: formularios
                    .map((formulario) => DropdownMenuItem<String>(
                          value: formulario,
                          child: Text(
                            formulario,
                            style: TextStyle(
                                fontSize: 20, fontFamily: Fontes.inter),
                          ),
                        ))
                    .toList(),
                onChanged: (formulario) =>
                    setState(() => selectedForm = formulario),
              ),
            ),
          ),
          Form(
            key: _formfield,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (selectedForm == "Aluno") ...[
                    const CadastroAluno()
                  ] else if (selectedForm == "Instituição") ...[
                    const CadastroInstituicao()
                  ],
                ]),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const LoginPage(),
                        type: PageTransitionType.rightToLeft));
              },
              child: Text(
                'Já possui uma conta? Faça Login',
                style: TextStyle(
                  fontFamily: Fontes.inter,
                  color: Cores.azul45B0F0,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
