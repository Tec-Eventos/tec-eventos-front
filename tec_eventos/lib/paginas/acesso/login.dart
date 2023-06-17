import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            './assets/t!e_logo.png',
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
          ),
          SizedBox(
            height: 30,
          ),
          const Text('Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff47BBEC),
                fontSize: 38.0,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBox(icon: Icons.email_outlined,hint: "E-mail"),
              TextBox(icon: Icons.person_2_outlined, hint: "Usuário"),
              TextBox(icon: Icons.lock_outlined, hint: "Senha"),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: TextButton(
                  onPressed: () {
                    PageTransition(
                        child: AllPages(paginaAtual: 0),
                        type: PageTransitionType.rightToLeft);
                  },
                  child: const Text(
                    'Esqueceu a senha?',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TextBox extends StatefulWidget {
  TextBox({Key? key, required this.hint, required this.icon}) : super(key: key);
  IconData icon;
  String hint;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
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
