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
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_password.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_telefone.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cdescolar.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cnpj.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_instituicao.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_tipo_inst.dart';

class CadastroInstituicao extends StatefulWidget {
  const CadastroInstituicao({super.key});

  @override
  State<CadastroInstituicao> createState() => _CadastroInstituicaoState();
}

class _CadastroInstituicaoState extends State<CadastroInstituicao> {
  final _formfield = GlobalKey<FormState>();

  final controllerCNPJ = TextEditingController();
  final controllerNomeInstituicao = TextEditingController();
  final controllertipoInst = TextEditingController();
  final controllerCdEscolar = TextEditingController();
  final controllerEmailInstituicao = TextEditingController();
  final controllerTellInst = TextEditingController();
  final controllerCEPInst = TextEditingController();
  final controllerSenhaInst = TextEditingController();
  final controllerConfirmSenhaInst = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formfield,
            child: SizedBox(
              height: 400,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextCNPJ(controllerCNPJ: controllerCNPJ)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextInstituicao(
                              controllerInstituicao:
                                  controllerNomeInstituicao)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextTipoInstituicao(
                              controllerTipoInstituicao: controllertipoInst)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextCdEscolar(
                              controllerCdEscolar: controllerCdEscolar)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextEmail(
                              controllerEmail: controllerEmailInstituicao)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextTelefone(
                              controllerTel: controllerTellInst)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child:
                              InputTextCEP(controllerCEP: controllerCEPInst)),
                      InputTextSenhaCadastro(
                        controllerSenha: controllerSenhaInst,
                        controllerConfirmSenha: controllerConfirmSenhaInst,
                      ),
                    ]).animate().fade(),
              ),
            )),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            if (_formfield.currentState!.validate()) {
              cadastrarInstituicao();
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

  Future<Widget> cadastrarInstituicao() async {
    final cnpj = controllerCNPJ.text.replaceAll(RegExp(r'[./]'), '');
    final nomeInst = controllerNomeInstituicao.text;
    final tipoInst = controllertipoInst.text;
    final cdEscolar = int.tryParse(controllerCdEscolar.text);
    final emailInst = controllerEmailInstituicao.text;
    final teleInst =
        controllerTellInst.text.replaceAll(RegExp(r'[\s\(\)-]'), '');
    final cepInst = controllerCEPInst.text.replaceAll('-', '');
    final senhaInst = controllerSenhaInst.text;

    final Map<String, dynamic> body = {
      "cd_escolar": cdEscolar,
      "cnpj": cnpj,
      "instituicao": nomeInst,
      "tipo_instituicao": tipoInst,
      "cep_inst": cepInst,
      "telefone": teleInst,
      "email": emailInst,
      "senha": senhaInst
    };

    //enviando a informação para o servidor
    const url = 'http://192.168.1.112:8080/escola';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    //mostrando o retorno da requisição
    if (response.statusCode == 200 || response.statusCode == 201) {
      return showMessageSuccess();
    } else {
      print(jsonEncode(body));
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
      title: "Instituição criada!",
      btnOkText: "Prosseguir",
      barrierColor: Cores.branco.withOpacity(0.7),
      btnOkOnPress: () async {
        const String userTypeKey = 'userType';
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString(userTypeKey, 'Instituição');

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
