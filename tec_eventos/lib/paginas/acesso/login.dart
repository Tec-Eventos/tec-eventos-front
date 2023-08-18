import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/acesso/cadastro.dart';
import 'package:tec_eventos/paginas/all_pages.dart';
import 'package:pinput/pinput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

int mudancaBottomSheet = 0;
Widget conteudoVerificacao = const EnvioEmail();

class _LoginPageState extends State<LoginPage> {
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
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              color: Cores.azul47BBEC,
              fontSize: 28,
            ),
          ),
          const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CaixaTexto(icon: Icons.email_outlined, hint: "E-mail"),
                CaixaTexto(icon: Icons.person_2_outlined, hint: "Usuário"),
                CaixaTexto(icon: Icons.lock_outlined, hint: "Senha")
              ]),
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
              style: GoogleFonts.inter(
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
                style: GoogleFonts.inter(
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
            style: GoogleFonts.inter(
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
                      style: GoogleFonts.inter(
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
                      style: GoogleFonts.inter(
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
                      style: GoogleFonts.inter(
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
              Navigator.push(
                  context,
                  PageTransition(
                      child: AllPages(paginaAtual: 0),
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
                    "Login",
                    style: GoogleFonts.raleway(
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
                style: GoogleFonts.inter(
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

//CAIXAS DE TEXTO PEDINDO A INFORMAÇÃO AO USUÁRIO
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

//LISTA DE CADA ETAPA PARA VERIFICAR SE O USUÁRIO ESQUECEU A SENHA
List<Widget> etapasVerificacao = [
  const EnvioEmail(),
  const VerificacaoCodigo()
];

class EnvioEmail extends StatefulWidget {
  const EnvioEmail({super.key});

  @override
  State<EnvioEmail> createState() => _EnvioEmailState();
}

class _EnvioEmailState extends State<EnvioEmail> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Esqueceu sua senha?",
        style: GoogleFonts.inter(
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        "Informe seu e-mail para que possamos lhe enviar um código de confirmação",
        style: GoogleFonts.inter(
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 50),
      Text(
        'Email',
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
              contentPadding:
                  EdgeInsets.only(top: 18.0, right: 20, bottom: 18.0, left: 40),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          setState(() {
            conteudoVerificacao = const VerificacaoCodigo();
          });
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
                "Enviar",
                style: GoogleFonts.raleway(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Cores.branco),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class VerificacaoCodigo extends StatefulWidget {
  const VerificacaoCodigo({super.key});

  @override
  State<VerificacaoCodigo> createState() => _VerificacaoCodigoState();
}

class _VerificacaoCodigoState extends State<VerificacaoCodigo> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Informe o código",
        style: GoogleFonts.inter(
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        "Informe o código de 4 digitos que mandamos para o email ************584@gmail.com",
        style: GoogleFonts.inter(
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 50),
      Text(
        'Código',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      const CodigoVerificador(),
    ]);
  }
}

class CodigoVerificador extends StatefulWidget {
  const CodigoVerificador({super.key});

  @override
  State<CodigoVerificador> createState() => _CodigoVerificadorState();
}

class _CodigoVerificadorState extends State<CodigoVerificador> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusedBorderColor = Cores.verde;
    final borderColor = Cores.preto;

    final defaultPinTheme = PinTheme(
      width: 54,
      height: 50,
      textStyle: GoogleFonts.inter(fontSize: 28, color: Cores.preto),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (value) {
                if (value == "2222") {
                  setState(() {
                    conteudoVerificacao = const RedefinaSuaSenha();
                  });
                } else {
                  return "Pin incorreto";
                }

                return '';
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              focusNode.unfocus();
              formKey.currentState!.validate();
            },
            child: const Text('Validate'),
          ),
        ],
      ),
    );
  }
}

class RedefinaSuaSenha extends StatefulWidget {
  const RedefinaSuaSenha({Key? key}) : super(key: key);

  @override
  _RedefinaSuaSenhaState createState() => _RedefinaSuaSenhaState();
}

class _RedefinaSuaSenhaState extends State<RedefinaSuaSenha> {
  int verSenha = 0;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Redefina sua senha",
        style: GoogleFonts.inter(
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        'Informe a nova senha abaixo',
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
              prefixIcon: Icon(Icons.abc_rounded),
              isDense: true,
              hintText: "*********",
              hintStyle: TextStyle(color: Color(0xffA69F9F)),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(top: 18.0, right: 20, bottom: 18.0, left: 40),
            ),
            obscureText: verSenha == 0 ? true : false,
          ),
        ),
      ),
      const SizedBox(height: 20),
      Text(
        'Confirme a nova senha',
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
              contentPadding:
                  EdgeInsets.only(top: 18.0, right: 20, bottom: 18.0, left: 40),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
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
                "Redefinir a senha",
                style: GoogleFonts.raleway(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Cores.branco),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
