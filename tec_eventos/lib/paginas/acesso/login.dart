import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/all_pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool selectedValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.Branco,
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
          const Text('Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff47BBEC),
                fontSize: 38.0,
              )),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            CaixaTexto(icon: Icons.email_outlined, hint: "E-mail"),
            CaixaTexto(icon: Icons.person_2_outlined, hint: "Usuário"),
            CaixaTexto(icon: Icons.lock_outlined, hint: "Senha")
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(

                    context: context,
                    isScrollControlled: true,
                    // padding: EdgeIn
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25))
                    ),
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: SizedBox(
                          height: 371,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                  "Esqueceu sua senha?",
                                  style: GoogleFonts.inter(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),

                                  const SizedBox(height: 20),

                                  Text("Informe seu e-mail para que possamos lhe enviar um código de confirmação",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 50),

                                  Text('Email',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),

                                  ),

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[300]!,
                                          offset: const Offset(10, 10),
                                          blurRadius: 6,
                                          spreadRadius: -5,
                                        )
                                      ]),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email_outlined),
                                      isDense: true,
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Color(0xffA69F9F)),
                                      border: InputBorder.none,

                                      contentPadding: EdgeInsets.only(
                                          top: 18.0, right: 20, bottom: 18.0, left: 40),
                                    ),
                                  ),
                                ),
                              ),

                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Container(
                                      width: 282,
                                      height: 52,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Cores.Azul47BBEC,
                                            Cores.Azul42A5F5,
                                          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Center(
                                        child: Text(
                                          "Enviar",
                                          style: GoogleFonts.raleway(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Cores.Branco),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                'Esqueceu a senha?',
                style: GoogleFonts.inter(
                  color: Cores.Azul45B0F0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Faça login por outras mídias sociais",
            style: GoogleFonts.inter(
              fontSize: 15,
              color: Cores.Cinza,
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
                      backgroundColor: Cores.Cinza,
                      child: Image.asset('assets/acesso/microsoft.png'),
                    ),
                    Text(
                      'Microsoft',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Cores.Cinza,
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
                      backgroundColor: Cores.Cinza,
                      child: Image.asset(
                        'assets/acesso/google.png',
                      ),
                    ),
                    Text(
                      'Google',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Cores.Cinza,
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
                      backgroundColor: Cores.Cinza,
                      child: Image.asset('assets/acesso/convidado.png'),
                    ),
                    Text(
                      'Convidado',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Cores.Cinza,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 282,
              height: 52,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Cores.Azul47BBEC,
                    Cores.Azul42A5F5,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Login",
                  style: GoogleFonts.raleway(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Cores.Branco),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: GestureDetector(
              onTap: () {
                PageTransition(
                    child: AllPages(paginaAtual: 0),
                    type: PageTransitionType.rightToLeft);
              },
              child: Text(
                'Não tem uma conta? Cadastre-se',
                style: GoogleFonts.inter(
                  color: Cores.Azul45B0F0,
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

class CaixaTexto extends StatefulWidget {
  CaixaTexto({Key? key, required this.hint, required this.icon})
      : super(key: key);
  IconData icon;
  String hint;

  @override
  State<CaixaTexto> createState() => _CaixaTextoState();
}

class _CaixaTextoState extends State<CaixaTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!,
                offset: const Offset(10, 10),
                blurRadius: 6,
                spreadRadius: -5,
              )
            ]),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            isDense: true,
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Color(0xffA69F9F)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(
                top: 18.0, right: 20, bottom: 18.0, left: 40),
          ),
        ),
      ),
    );
  }
}
