import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class ConfigGeralWithNavigator extends StatefulWidget {
  const ConfigGeralWithNavigator(
      {Key? key,
      required this.icone,
      required this.opcao,
      required this.pagina})
      : super(key: key);

  final String opcao;
  final IconData icone;
  final Widget pagina;
  @override
  State<ConfigGeralWithNavigator> createState() =>
      _ConfigGeralWithNavigatorState();

      
}

class _ConfigGeralWithNavigatorState extends State<ConfigGeralWithNavigator> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: widget.pagina, type: PageTransitionType.bottomToTop));
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