import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/utils/providers/instituicao_provider.dart';
import 'package:tec_eventos/widgets/Cards/cards_adicionados_recentemente_instituicao/cards_add_recentemente_instituicao.dart';
import 'package:tec_eventos/widgets/Cards/cards_eventos_da_instituicao/cards_eventos_da_instituicao.dart';
import 'package:tec_eventos/widgets/botao/botao.dart';

class PrincipalPageInstituicao extends StatefulWidget {
  const PrincipalPageInstituicao({Key? key}) : super(key: key);

  @override
  _PrincipalPageInstituicaoState createState() =>
      _PrincipalPageInstituicaoState();
}

class _PrincipalPageInstituicaoState extends State<PrincipalPageInstituicao> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InstituicaoProvider>(builder: (context, user, _) {
      if (user.cdEscolar == null ||
          user.nomeInstituicao == null ||
          user.emailInstituicao == null) {
        return const Center(
            child:
                CircularProgressIndicator()); // ou outro indicador de carregamento
      }

      return Expanded(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    height: 119,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Cores.azulEscuroPerfilOption.withOpacity(0.38),
                            Cores.azulAFDAFA.withOpacity(0.5),
                            Cores.azulC8E6FC.withOpacity(0.4)
                          ],
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.nomeInstituicao ?? "Sem nome",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: Fontes.ralewayBold),
                                ),
                                Text(
                                  user.emailInstituicao ?? "Sem email",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: Fontes.raleway,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Icon(
                            Icons.school,
                            size: 50,
                            color: Cores.azulEscuroPerfilOption,
                          )
                          // Image.asset(
                          //   "assets/unimarImagem.png",
                          //   fit: BoxFit.contain,
                          //   height: 100,
                          //   width: 100,
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Eventos de sua instituição",
                  style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        CardsEventosInstituicao(),
                        CardsEventosInstituicao(),
                        CardsEventosInstituicao(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Adicionados recentemente",
                  style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [CardsRecentesInstituicao()],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Botao()
              ],
            )
          ],
        ),
      );
    });
  }
}
