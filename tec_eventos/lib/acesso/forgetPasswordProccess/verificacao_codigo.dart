import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';
import 'package:tec_eventos/acesso/forgetPasswordProccess/envioEmail.dart';
import 'package:tec_eventos/acesso/forgetPasswordProccess/redefinir_senha.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/acesso/login.dart';


class VerificacaoCodigo extends StatefulWidget {
  const VerificacaoCodigo({super.key});

  @override
  State<VerificacaoCodigo> createState() => _VerificacaoCodigoState();
}

class _VerificacaoCodigoState extends State<VerificacaoCodigo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
      Text(
      "Informe o código",
      style: TextStyle(
        fontFamily: Fontes.inter,
        fontSize: 23,
        fontWeight: FontWeight.w500,
      ),
    ),
    const SizedBox(height: 20),
    Text(
    "Informe o código de 4 digitos que mandamos para o email ************584@gmail.com",
    style: TextStyle(
      fontFamily: Fontes.inter,
    fontSize: 16,
    ),
    ),
    const SizedBox(height: 50),
    Text(
    'Código',
    style: TextStyle(
      fontFamily: Fontes.inter,
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
      textStyle: TextStyle(
          fontSize: 28, fontFamily: Fontes.inter, color: Cores.preto),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Column(

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

              setState(() {
                conteudoVerificacao = const EnvioEmail();
              });

            },
            child: const Text('Reenviar Email'),
          ),

        ],
      ),
    );
  }
}
