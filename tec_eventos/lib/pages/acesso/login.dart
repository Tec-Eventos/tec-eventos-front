import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/pages/acesso/forgetPasswordProccess/envioEmail.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/acesso/cadastro.dart';
import 'package:tec_eventos/all_pages.dart';
import 'package:tec_eventos/widgets/InputText/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

int mudancaBottomSheet = 0;
Widget conteudoVerificacao = const EnvioEmail();

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  //acesso do ALUNO
  //email = bielzinho@gmail.com
  //user = fgabrielmorais;
  //senha = 1234

  //acesso da instituição
  //email = unicamp@gmail.com
  //user = unicamp;
  //senha = 1222

  bool selectedValue = true;
  bool isChecked = false;

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
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Fontes.inter,
              fontWeight: FontWeight.w500,
              color: Cores.azul47BBEC,
              fontSize: 28,
            ),
          ),
          Form(
            key: _formfield,
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: InputTextEmail()),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: InputTextName()),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: InputTextPassword()),
                ]),
          ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: GestureDetector(
              onTap: () {
                //a tela que aparecerá a respeito do usuário esquecer a senha
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // padding: EdgeIn
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    builder: (context) {
                      return StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: SizedBox(
                            height: 371,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: conteudoVerificacao,
                            ),
                          ),
                        );
                      });
                    });
              },
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  fontFamily: Fontes.inter,
                  color: Cores.azul45B0F0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Faça login por outras mídias sociais",
            style: TextStyle(
              fontFamily: Fontes.inter,
              fontSize: 15,
              color: Cores.cinza,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Cores.cinza,
                      child: Image.asset('assets/acesso/microsoft.png'),
                    ),
                    Text(
                      'Microsoft',
                      style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontSize: 15,
                        color: Cores.cinza,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Cores.cinza,
                      child: Image.asset(
                        'assets/acesso/google.png',
                      ),
                    ),
                    Text(
                      'Google',
                      style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontSize: 15,
                        color: Cores.cinza,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Cores.cinza,
                      child: Image.asset('assets/acesso/convidado.png'),
                    ),
                    Text(
                      'Convidado',
                      style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontSize: 15,
                        color: Cores.cinza,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //acesso do ALUNO
              //email = bielzinho@gmail.com
              //user = fgabrielmorais;
              //senha = 1234

              //acesso da instituição
              //email = unicamp@gmail.com
              //user = unicamp;
              //senha = 1222

              if (_formfield.currentState!.validate()) {
                Navigator.push(
                    context,
                    PageTransition(
                        child: AllPages(paginaAtual: 0),
                        type: PageTransitionType.rightToLeft));

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const Cadastro(),
                        type: PageTransitionType.rightToLeft));
              },
              child: Text(
                'Não tem uma conta? Cadastre-se',
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
      ),
    );
  }
}
