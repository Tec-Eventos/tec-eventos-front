import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/widgets/InputText/input_text.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formfield = GlobalKey<FormState>();
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
            'Cadastre-se',
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
            child:  Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                
                ]),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: AllPages(
                        paginaAtual: 0,
                      ),
                      type: PageTransitionType.rightToLeft));
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Já tem uma conta? Faça o login',
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

class CaixaTexto extends StatefulWidget {
  const CaixaTexto({Key? key, required this.hint, required this.icon})
      : super(key: key);
  final IconData icon;
  final String hint;

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

class CaixaTextoSenha extends StatelessWidget {
  const CaixaTextoSenha({Key? key, required this.icon, required this.hint})
      : super(key: key);
  final IconData icon;
  final String hint;

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
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            isDense: true,
            hintText: hint,
            hintStyle:
                TextStyle(color: Color(0xffA69F9F), fontFamily: Fontes.inter),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(
                top: 18.0, right: 20, bottom: 18.0, left: 40),
          ),
        ),
      ),
    );
  }
}

class CaixaTextoDataNascimento extends StatelessWidget {
  const CaixaTextoDataNascimento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 52,
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
                hintText: "dia",
                isDense: true,
                hintStyle: TextStyle(
                    color: Color(0xffA69F9F), fontFamily: Fontes.inter),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 20),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 72,
            height: 52,
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
                hintText: "mês",
                isDense: true,
                hintStyle: TextStyle(
                    color: Color(0xffA69F9F), fontFamily: Fontes.inter),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 20),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 115,
            height: 52,
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
                hintText: "ano",
                isDense: true,
                hintStyle: TextStyle(
                    color: Color(0xffA69F9F), fontFamily: Fontes.inter),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
