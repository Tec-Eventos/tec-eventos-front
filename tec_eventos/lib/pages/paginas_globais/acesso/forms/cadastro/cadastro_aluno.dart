import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                        InputTextSenhaCadastro(
                        controllerSenha: controllerSenhaAluno,
                        controllerConfirmSenha: controllerConfirmSenha,
                      ),
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
      ],
    );
  }

  Future<Widget> cadastrarAluno() async {
    final nome = controllerNomeAluno.text;
    final email = controllerEmailAluno.text;
    final telefone = controllerTellAluno.text.replaceAll(RegExp(r'[\s\(\)-]'), '');
    final cepAluno = controllerCEPAluno.text;
    final cdEscolar = int.tryParse(controllerInstAluno.text);
    final rmAluno = int.tryParse(controllerRmAlunooo.text) ?? 0;
    final senha = controllerSenhaAluno.text;

    final Map<String, dynamic> body = {
      "rm_aluno": rmAluno,
      "nome": nome,
      "email": email,
      "telefone": telefone,
      "cep_aluno": cepAluno,
      "senha": senha,
      "cd_escolar": cdEscolar
    };

    //enviando a informação para o servidor
    const url = 'http://192.168.1.112:8080/aluno';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    //mostrando o retorno da requisição
    if (response.statusCode == 200) {
      return showMessageSuccess();
    } else {
      return showMessageError();
    }
  }

  showMessageSuccess() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      titleTextStyle:
          TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.w600),
      title: "Usuário criado!",
      btnOkText: "Prosseguir",
      barrierColor: Cores.branco.withOpacity(0.7),
      btnOkOnPress: () async {
        const String userTypeKey = 'userType';
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString(userTypeKey, 'Aluno');

        Navigator.push(
            context,
            PageTransition(
                child: AllPages(paginaAtual: 0),
                type: PageTransitionType.rightToLeft));
      },
      btnOkColor: Cores.azul42A5F5,
    ).show();
  }

  showMessageError() {
    final snackBar = SnackBar(
      elevation: 0,
      content: Text(
        'Informações inválidas',
        style: TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Cores.vermelho,
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
