
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';



//sair do aplicativo
class ConfigGeralWithShowDialogExitApp extends StatefulWidget {
  const ConfigGeralWithShowDialogExitApp(
      {Key? key, required this.opcao, required this.icone})
      : super(key: key);

  final String opcao;
  final IconData icone;

  @override
  _ConfigGeralWithShowDialogExitAppState createState() =>
      _ConfigGeralWithShowDialogExitAppState();
}

class _ConfigGeralWithShowDialogExitAppState
    extends State<ConfigGeralWithShowDialogExitApp> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                title: Text("Deseja sair do app?",
                    style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                content:
                    Text("Ao clicar em sim, você sairá do nosso aplicativo.",
                        style: TextStyle(
                          fontFamily: Fontes.inter,
                          fontSize: 15,
                        )),
                actions: [
                  TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("SIM",
                          style: TextStyle(
                              fontFamily: Fontes.inter,
                              fontWeight: FontWeight.bold,
                              color: Cores.azul42A5F5))),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: Text("NÃO",
                          style: TextStyle(
                              fontFamily: Fontes.inter,
                              fontWeight: FontWeight.bold,
                              color: Cores.azul42A5F5))),
                ],
              );
            });
      },
      contentPadding: const EdgeInsets.symmetric(),
      shape: Border(
        bottom: BorderSide(
          color: Cores.cinzaMaisClaro,
          width: 1.0,
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(widget.icone, color: Cores.preto, size: 20),
      title: Text(widget.opcao,
          style: TextStyle(
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Cores.preto)),
      trailing: Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
    );
  }
}










//deletar a conta
class ConfigGeralWithShowDialogDeleteAccount extends StatefulWidget {
  const ConfigGeralWithShowDialogDeleteAccount(
      {Key? key, required this.opcao, required this.icone})
      : super(key: key);

  final String opcao;
  final IconData icone;
  @override
  _ConfigGeralWithShowDialogDeleteAccountState createState() =>
      _ConfigGeralWithShowDialogDeleteAccountState();
}

class _ConfigGeralWithShowDialogDeleteAccountState
    extends State<ConfigGeralWithShowDialogDeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                title: Text("Deseja mesmo deletar a conta? ",
                    style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                content: Text(
                    "Ao clicar em sim, você terá seu usuário permanentemente suspenso.",
                    style: TextStyle(
                      fontFamily: Fontes.inter,
                      fontSize: 15,
                    )),
                actions: [
                  TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("SIM",
                          style: TextStyle(
                              fontFamily: Fontes.inter,
                              fontWeight: FontWeight.bold,
                              color: Cores.azul42A5F5))),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: Text("NÃO",
                          style: TextStyle(
                              fontFamily: Fontes.inter,
                              fontWeight: FontWeight.bold,
                              color: Cores.azul42A5F5))),
                ],
              );
            });
      },
      contentPadding: const EdgeInsets.symmetric(),
      shape: Border(
        bottom: BorderSide(
          color: Cores.cinzaMaisClaro,
          width: 1.0,
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(widget.icone, color: Cores.preto, size: 20),
      title: Text(widget.opcao,
          style: TextStyle(
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Cores.preto)),
      trailing: Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
    );
  }
}