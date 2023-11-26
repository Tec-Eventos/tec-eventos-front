import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/cadastro.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/forms/login/login_aluno.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/forms/login/login_instituicao.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            'Login',
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
          if (selectedForm == "Aluno") ...[
            const LoginAluno()
          ] else if (selectedForm == "Instituição") ...[
            const LoginInstituicao()
          ],
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















///FUNÇÃO DE ESQUECER A SENHA
/// JUNTAMENTE DAS OUTRAS OPÇÕES DE LOGIN
/// 
/// 
/// 
// int mudancaBottomSheet = 0;
// Widget conteudoVerificacao = const EnvioEmail();
/// 
///   Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //   child: GestureDetector(
          //     onTap: () {
          //       //a tela que aparecerá a respeito do usuário esquecer a senha
          //       showModalBottomSheet(
          //           context: context,
          //           isScrollControlled: true,
          //           // padding: EdgeIn
          //           shape: const RoundedRectangleBorder(
          //               borderRadius:
          //                   BorderRadius.vertical(top: Radius.circular(25))),
          //           builder: (context) {
          //             return StatefulBuilder(builder:
          //                 (BuildContext context, StateSetter setState) {
          //               return Padding(
          //                 padding: MediaQuery.of(context).viewInsets,
          //                 child: SizedBox(
          //                   height: 371,
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(20.0),
          //                     child: conteudoVerificacao,
          //                   ),
          //                 ),
          //               );
          //             });
          //           });
          //     },
          //     child: Text(
          //       'Esqueceu a senha?',
          //       style: TextStyle(
          //         fontFamily: Fontes.inter,
          //         color: Cores.azul45B0F0,
          //         fontWeight: FontWeight.w400,
          //       ),
          //       textAlign: TextAlign.start,
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 30),
          // Text(
          //   "Faça login por outras mídias sociais",
          //   style: TextStyle(
          //     fontFamily: Fontes.inter,
          //     fontSize: 15,
          //     color: Cores.cinza,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 40),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Column(
          //         children: [
          //           CircleAvatar(
          //             backgroundColor: Cores.cinza,
          //             child: Image.asset('assets/acesso/microsoft.png'),
          //           ),
          //           Text(
          //             'Microsoft',
          //             style: TextStyle(
          //               fontFamily: Fontes.inter,
          //               fontSize: 15,
          //               color: Cores.cinza,
          //             ),
          //           )
          //         ],
          //       ),
          //       const SizedBox(
          //         width: 50,
          //       ),
          //       Column(
          //         children: [
          //           CircleAvatar(
          //             backgroundColor: Cores.cinza,
          //             child: Image.asset(
          //               'assets/acesso/google.png',
          //             ),
          //           ),
          //           Text(
          //             'Google',
          //             style: TextStyle(
          //               fontFamily: Fontes.inter,
          //               fontSize: 15,
          //               color: Cores.cinza,
          //             ),
          //           )
          //         ],
          //       ),
          //       const SizedBox(
          //         width: 50,
          //       ),
          //       Column(
          //         children: [
          //           CircleAvatar(
          //             backgroundColor: Cores.cinza,
          //             child: Image.asset('assets/acesso/convidado.png'),
          //           ),
          //           Text(
          //             'Convidado',
          //             style: TextStyle(
          //               fontFamily: Fontes.inter,
          //               fontSize: 15,
          //               color: Cores.cinza,
          //             ),
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),