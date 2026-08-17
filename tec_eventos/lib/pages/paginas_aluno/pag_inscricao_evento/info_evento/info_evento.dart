import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/widgets/botaoInfoEvento/inscrever/inscrever.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/google_maps.dart';

/// URL base para imagens obtidas do backend.
const String urlImage = 'https://api-tec-eventos-i6hr.onrender.com/imagem/';

/// Tela de exibição das informações detalhadas de um evento para o aluno.
///
/// Permite visualizar a imagem de capa, nome, descrição, quantidade de ingressos
/// restantes, localização no mapa e se inscrever no evento.
class InfoEvento extends StatelessWidget {
  /// Caminho da imagem de capa do evento.
  final String imagemEvento;

  /// Caminho do logotipo da instituição organizadora.
  final String imagemOrganizacao;

  /// Data de realização no formato ISO.
  final String diaRealizacao;

  /// Horário de realização do evento.
  final String horarioRealizacao;

  /// Título ou nome do evento.
  final String nomeEvento;

  /// Descrição detalhada do evento.
  final String descricao;

  /// Identificador único do evento.
  final int cdEvento;

  /// Quantidade de ingressos disponíveis.
  final int ingressos;

  /// Construtor padrão da tela de informações do evento.
  const InfoEvento({
    super.key,
    required this.imagemEvento,
    required this.imagemOrganizacao,
    required this.diaRealizacao,
    required this.nomeEvento,
    required this.horarioRealizacao,
    required this.descricao,
    required this.cdEvento,
    required this.ingressos,
  });

  @override
  Widget build(BuildContext context) {
    DateTime data = DateTime.tryParse(diaRealizacao)?.toLocal() ?? DateTime.now();
    String dataFormatada = "${data.day}/${data.month}/${data.year}";

    int hourVal = 0;
    int minVal = 0;
    final splitted = horarioRealizacao.split(":");
    if (splitted.isNotEmpty) hourVal = int.tryParse(splitted[0]) ?? 0;
    if (splitted.length > 1) minVal = int.tryParse(splitted[1]) ?? 0;

    TimeOfDay hora = TimeOfDay(
      hour: hourVal,
      minute: minVal,
    );
    String horaFormatada = "${hora.hour}h${hora.minute.toString().padLeft(2, '0')}";

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          AppBarEventosInfo(imagem: imagemEvento),
        ],
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Cabeçalho básico com data, horário e logo da organização
            ListTile(
              shape: const Border(bottom: BorderSide(color: Cores.cinza)),
              style: ListTileStyle.drawer,
              title: Text(
                "$dataFormatada às $horaFormatada",
                style: const TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 20,
                  color: Cores.cinza6A6666,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                nomeEvento,
                style: const TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 22,
                  color: Cores.preto,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.network(
                  urlImage + imagemOrganizacao,
                  fit: BoxFit.contain,
                  height: 90,
                  width: 90,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Informações do ingresso",
                    style: const TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundColor: Cores.azul42A5F5,
                          child: Icon(
                            Icons.chair_outlined,
                            color: Cores.branco,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text('$ingressos ingressos disponíveis'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundColor: Cores.azul42A5F5,
                          child: Icon(
                            Icons.payments_outlined,
                            color: Cores.branco,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text("Grátis"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Descrição",
                    style: const TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    descricao,
                    style: const TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Local",
                    style: const TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Confira o local onde o evento ocorrerá",
                    style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 135,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(
                          color: Cores.azul42A5F5,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const GooglePage(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_on_outlined, color: Cores.azul42A5F5),
                          Text(
                            "Ver no mapa",
                            style: TextStyle(
                              fontFamily: Fontes.raleway,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Cores.azul42A5F5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Imagens do local",
                    style: const TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                        Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                        Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                        Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                        Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                        Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Inscrever(cdEvento: cdEvento),
    );
  }
}

/// AppBar personalizada para a tela de informações do evento.
class AppBarEventosInfo extends StatelessWidget {
  /// Nome/caminho da imagem a ser exibida como fundo na AppBar.
  final String imagem;

  /// Construtor padrão da AppBar de eventos info.
  const AppBarEventosInfo({Key? key, required this.imagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height;

    return SliverAppBar(
      expandedHeight: displayHeight / 3,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          urlImage + imagem,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
      floating: true,
      snap: true,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Cores.preto,
        ),
      ),
    );
  }
}
