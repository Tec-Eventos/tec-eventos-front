import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_cep.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_email.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_telefone.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_aluno/input_name.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_password.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_aluno/input_rmaluno.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_instituicao.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/forms/login/login_aluno.dart';

class CadastroAluno extends StatefulWidget {
  const CadastroAluno({super.key});

  @override
  State<CadastroAluno> createState() => _CadastroAlunoState();
}

class _CadastroAlunoState extends State<CadastroAluno> {
  final _formfield = GlobalKey<FormState>();
  final controllerNomeAluno = TextEditingController();
  final controllerEmailAluno = TextEditingController();
  final controllerTellAluno = TextEditingController();
  final controllerCEPAluno = TextEditingController();
  final controllerInstAluno = TextEditingController();
  final controllerRmAlunooo = TextEditingController();
  final controllerSenhaAluno = TextEditingController();
  final controllerConfirmSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formfield,
            child: SizedBox(
              height: 400,
              width: 350,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextName(
                              controllerUser: controllerNomeAluno)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextEmail(
                              controllerEmail: controllerEmailAluno)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextTelefone(
                              controllerTel: controllerTellAluno)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child:
                              InputTextCEP(controllerCEP: controllerCEPAluno)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextInstituicao(
                              controllerInstituicao: controllerInstAluno)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextRmAluno(
                              controllerRmAluno: controllerRmAlunooo)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextPassword(
                              controllerSenha: controllerSenhaAluno)),
                      // Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 10, horizontal: 20),
                      //     child: InputTextPassword(
                      //         controllerSenha: controllerConfirmSenha)),
                    ]).animate().fade(),
              ),
            )),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            if (_formfield.currentState!.validate()) {
              setState(() => userType = "Aluno");
              cadastrarAluno();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 282,
              height: 52,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Cores.azul47BBEC,
                    Cores.azul42A5F5,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Cadastrar-se",
                  style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Cores.branco),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Já tem uma conta? Faça o login',
              style: TextStyle(
                fontFamily: Fontes.inter,
                color: Cores.azul45B0F0,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> cadastrarAluno() async {
    final nome = controllerNomeAluno.text;
    final email = controllerEmailAluno.text;
    final telefone = controllerTellAluno.text;
    final cepAluno = controllerCEPAluno.text;
    final cdEscolar = int.tryParse(controllerInstAluno.text);
    final rmAluno = int.tryParse(controllerRmAlunooo.text) ?? 0;
    final senha = controllerSenhaAluno.text;

    final body = {
      "rm_aluno": rmAluno,
      "nome": nome,
      "email": email,
      "telefone": telefone,
      "cep_aluno": cepAluno,
      "senha": senha,
      "cd_escolar": cdEscolar
    };

    //enviando a informação para o servidor
    const url = 'http://dominio/aluno';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    //mostrando o retorno da requisição
    if (response.statusCode == 200) {
      print('Sucesso na criação');

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        title: "Usuário Criado",
        btnOkText: "Fechar",
        barrierColor: Cores.branco.withOpacity(0.7),
        btnOkOnPress: () {
          Navigator.push(
              context,
              PageTransition(
                  child: AllPages(paginaAtual: 0),
                  type: PageTransitionType.rightToLeft));
        },
        btnOkColor: Cores.azul42A5F5,
      ).show();
    } else {
      print('Falha na criação');
      print(response.body);
    }
  }

  void showMessageSuccess() {}
  void showMessageError() {}
}
