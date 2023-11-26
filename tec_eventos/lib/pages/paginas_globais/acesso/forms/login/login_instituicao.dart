import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cdescolar.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_email.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_instituicao.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_password.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/forms/login/login_aluno.dart';

final controllerInstituicao = TextEditingController();
final controllerCdEscolar = TextEditingController();
final controllerEmailInst = TextEditingController();
final controllerSenhaInst = TextEditingController();

class LoginInstituicao extends StatefulWidget {
  const LoginInstituicao({super.key});

  @override
  State<LoginInstituicao> createState() => _LoginInstituicaoState();
}

class _LoginInstituicaoState extends State<LoginInstituicao> {
  final _formfield = GlobalKey<FormState>();
  bool selectedValue = true;
  bool isChecked = false;

  void validateInstituicao() {
    if (controllerEmailInst.text == "u@gmail.com" &&
        controllerInstituicao.text == "uu" &&
        controllerCdEscolar.text == "111" &&
        controllerSenhaInst.text == "123456") {
      setState(() => userType = "Instituição");
    } else {
      setState(() => userType = "Desconhecido");
    }
  }

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
                          controllerInstituicao: controllerInstituicao)),
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
          onTap: () {
            if (_formfield.currentState!.validate()) {
              validateInstituicao();
              if (userType == "Instituição") {
                Navigator.push(
                    context,
                    PageTransition(
                        child: AllPages(paginaAtual: 0),
                        type: PageTransitionType.rightToLeft));
              } else {
                final snackbar = SnackBar(
                  content: const Text("Usuário não encontrado"),
                  action: SnackBarAction(label: "Ok", onPressed: () {}),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }

              // controllerEmail.clear();
              // controllerUser.clear();
              // controllerSenha.clear();
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
}
