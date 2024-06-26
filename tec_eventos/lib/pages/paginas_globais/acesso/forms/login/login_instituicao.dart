import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cdescolar.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_email.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_instituicao.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_password.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/forms/cadastro/cadastro_instituicao.dart';
import 'package:tec_eventos/utils/providers/instituicao_provider.dart';

final controllerNomeInst = TextEditingController();
final controllerCdEscolar = TextEditingController();
final controllerEmailInst = TextEditingController();
final controllerSenhaInst = TextEditingController();
bool isChecked = false;

class LoginInstituicao extends StatefulWidget {
  const LoginInstituicao({super.key});

  @override
  State<LoginInstituicao> createState() => _LoginInstituicaoState();
}

class _LoginInstituicaoState extends State<LoginInstituicao> {
  final _formfield = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formfield,
          child: SizedBox(
            width: 350,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: InputTextInstituicao(
                          controllerInstituicao: controllerNomeInst)),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: InputTextCdEscolar(
                          controllerCdEscolar: controllerCdEscolar)),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: InputTextEmail(
                        controllerEmail: controllerEmailInst,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: InputTextPassword(
                        controllerSenha: controllerSenhaInst,
                      )),
                ]).animate().fade(),
          ),
        ),

        //LEMBRAR-SE DE MIM
        ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          autofocus: true,
          dense: true,
          leading: Checkbox(
            shape: const CircleBorder(),
            activeColor: Cores.azul42A5F5,
            value: isChecked,
            onChanged: (value) {
              isChecked = !isChecked;
              setState(() {});
            },
          ),
          title: Text(
            "Lembrar-se de mim",
            style: TextStyle(
              fontFamily: Fontes.inter,
              fontSize: 15,
            ),
          ),
        ),

        GestureDetector(
          onTap: () async {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (_formfield.currentState!.validate()) {
              bool deuCerto = await login();

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              if (deuCerto) {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: AllPages(paginaAtual: 0),
                        type: PageTransitionType.bottomToTop));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
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
                  "Login",
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

  final snackBar = SnackBar(
    elevation: 0,
    content: Text(
      'Informações inválidas',
      style: TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Cores.vermelho,
  );

  Future<bool> login() async {
    const String userTypeKey = 'userType';
    const String nomeKey = 'nome';
    const String emailKey = 'email';
    const String cdEscolarKey = 'cd_escolar';

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    int cdEscolar = int.parse(controllerCdEscolar.text);
    String nome = controllerNomeInst.text;
    String email = controllerEmailInst.text;
    String senha = controllerSenhaInst.text;

    final body = {
      "cd_escolar": cdEscolar,
      "instituicao": nome,
      "email": email,
      "senha": senha
    };

    var url = Uri.parse('https://api-tec-eventos-i6hr.onrender.com/loginEscola');
    var response = await http.post(url,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      await sharedPreferences.setString(userTypeKey, 'Instituição');
      await sharedPreferences.setString(nomeKey, nome);
      await sharedPreferences.setString(emailKey, email);
      await sharedPreferences.setInt(cdEscolarKey, cdEscolar);

      print(sharedPreferences.setString(nomeKey, nome));
      Provider.of<InstituicaoProvider>(context, listen: false)
          .acessarInfos(cdEscolar, nome, email);

      //SE A OPÇÃO LEMBRAR-SE DE MIM ESTIVER ATIVADA
      if (isChecked) {
        await sharedPreferences.setString(
            'token', "Token ${jsonDecode(response.body)['token']}");
      }

      return true;
    } else {
      return false;
    }
  }
}
