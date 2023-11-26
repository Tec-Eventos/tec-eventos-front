import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_cep.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_email.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_password.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_telefone.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cdescolar.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cnpj.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_instituicao.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_tipo_inst.dart';

final controllerCNPJ = TextEditingController();
final controllerNomeInstituicao = TextEditingController();
final controllertipoInst = TextEditingController();
final controllerCdEscolar = TextEditingController();
final controllerEmailInstituicao = TextEditingController();
final controllerTellInst = TextEditingController();
final controllerCEPInst = TextEditingController();
final controllerSenhaInst = TextEditingController();
final controllerConfirmSenhaInst = TextEditingController();

class CadastroInstituicao extends StatefulWidget {
  const CadastroInstituicao({super.key});

  @override
  State<CadastroInstituicao> createState() => _CadastroInstituicaoState();
}

class _CadastroInstituicaoState extends State<CadastroInstituicao> {
  final _formfield = GlobalKey<FormState>();

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
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextPassword(
                              controllerSenha: controllerSenhaInst)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InputTextPassword(
                              controllerSenha: controllerConfirmSenhaInst)),
                    ]).animate().fade(),
              ),
            )),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            if (_formfield.currentState!.validate()) {}
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
    ;
  }
}
