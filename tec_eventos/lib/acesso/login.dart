import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/acesso/forgetPasswordProccess/envioEmail.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/acesso/cadastro.dart';
import 'package:tec_eventos/all_pages.dart';

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

  final controllerEmail = TextEditingController();
  final controllerUser = TextEditingController();
  final controllerSenha = TextEditingController();
  bool passToggle = true;

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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        isDense: true,
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        //   contentPadding: const EdgeInsets.only(
                        //       top: 18.0, right: 20, bottom: 18.0, left: 40),
                        // ),
                      ),
                      validator: (value) {
                        bool emailValid = RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value!);

                        if (value.isEmpty) {
                          return "Coloque o email";
                        } else if (!emailValid) {
                          return "Coloque um email válido";
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: controllerUser,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        isDense: true,
                        labelText: "Usuário",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: controllerSenha,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Senha",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        prefixIcon: const Icon(Icons.lock),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off_outlined),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Coloque a senha";
                        } else if (controllerSenha.text.length < 6) {
                          return "Senha curta, coloque acima de 6 caracteres";
                        }
                      },
                    ),
                  ),

                  //   CaixaTexto(
                  //     icon: Icons.email_outlined,
                  //     hint: "E-mail",
                  //     dadosUsuario: controllerEmail),
                  // CaixaTexto(
                  //     icon: Icons.person_2_outlined,
                  //     hint: "Usuário",
                  //     dadosUsuario: controllerUser),
                  // CaixaTextoSenha(
                  //     icon: Icons.lock_outlined,
                  //     hint: "Senha",
                  //     senhaUser: controllerSenha),
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

// //CAIXAS DE TEXTO PEDINDO A INFORMAÇÃO AO USUÁRIO
// class CaixaTexto extends StatefulWidget {
//   const CaixaTexto(
//       {Key? key,
//       required this.hint,
//       required this.icon,
//       required this.dadosUsuario})
//       : super(key: key);
//   final IconData icon;
//   final String hint;
//   final TextEditingController dadosUsuario;

//   @override
//   State<CaixaTexto> createState() => _CaixaTextoState();
// }

// class _CaixaTextoState extends State<CaixaTexto> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey[300]!,
//                 offset: const Offset(10, 10),
//                 blurRadius: 6,
//                 spreadRadius: -5,
//               )
//             ]),
//         child: TextFormField(
//           validator: (value) {
//             if (value == "oi") {}
//           },
//           controller: widget.dadosUsuario,
//           decoration: InputDecoration(
//             prefixIcon: Icon(widget.icon),
//             isDense: true,
//             hintText: widget.hint,
//             hintStyle: const TextStyle(color: Color(0xffA69F9F)),
//             border: InputBorder.none,
//             contentPadding: const EdgeInsets.only(
//                 top: 18.0, right: 20, bottom: 18.0, left: 40),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CaixaTextoSenha extends StatelessWidget {
//   const CaixaTextoSenha(
//       {Key? key,
//       required this.icon,
//       required this.hint,
//       required this.senhaUser})
//       : super(key: key);
//   final IconData icon;
//   final String hint;
//   final TextEditingController senhaUser;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey[300]!,
//                 offset: const Offset(10, 10),
//                 blurRadius: 6,
//                 spreadRadius: -5,
//               )
//             ]),
//         child: TextFormField(
//           controller: senhaUser,
//           obscureText: true,
//           decoration: InputDecoration(
//             prefixIcon: Icon(icon),
//             isDense: true,
//             hintText: hint,
//             hintStyle:
//                 TextStyle(color: Color(0xffA69F9F), fontFamily: Fontes.inter),
//             border: InputBorder.none,
//             contentPadding: const EdgeInsets.only(
//                 top: 18.0, right: 20, bottom: 18.0, left: 40),
//           ),
//         ),
//       ),
//     );
//   }
// }
