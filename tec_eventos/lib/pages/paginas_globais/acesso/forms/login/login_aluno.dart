import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_email.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_aluno/input_name.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_password.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_aluno/input_rmaluno.dart';

final controllerEmailAluno = TextEditingController();
final controllerSenhaAluno = TextEditingController();
final controllerNomeAluno = TextEditingController();
final controllerRmAluno = TextEditingController();

String userType = "";

class LoginAluno extends StatefulWidget {
  const LoginAluno({super.key});

  @override
  State<LoginAluno> createState() => _LoginAlunoState();
}

class _LoginAlunoState extends State<LoginAluno> {
  final _formfield = GlobalKey<FormState>();
  bool selectedValue = true;
  bool isChecked = false;

  void validateAluno() {
    if (controllerEmailAluno.text == "o@gmail.com" &&
        controllerNomeAluno.text == "oi" &&
        controllerRmAluno.text == "21" &&
        controllerSenhaAluno.text == "123456") {
      setState(() => userType = "Aluno");
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
                        child:
                            InputTextName(controllerUser: controllerNomeAluno)),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: InputTextRmAluno(
                            controllerRmAluno: controllerRmAluno)),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: InputTextEmail(
                            controllerEmail: controllerEmailAluno)),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: InputTextPassword(
                          controllerSenha: controllerSenhaAluno,
                        )),
                  ]).animate().fade(),
            )),

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
              validateAluno();
              if (userType == "Aluno") {
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
