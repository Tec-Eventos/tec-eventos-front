import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento_pendentes/info_evento_pendente.dart';

/// Card que exibe um evento cadastrado pela própria Instituição.
///
/// Permite visualizar e abrir a edição do evento.
class CardsEventosInstituicaoWidget extends StatelessWidget {
  /// O evento correspondente.
  final AppEvent event;

  /// Construtor do widget.
  const CardsEventosInstituicaoWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const urlImage = 'https://api-tec-eventos-i6hr.onrender.com/imagem/';

    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
        height: 160,
        width: 320,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: const InfoEventoPendentes(),
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
          child: Card(
            shadowColor: Cores.preto,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Cores.branco,
            elevation: 4,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.instituicao.isNotEmpty ? event.instituicao : "Instituição",
                          style: const TextStyle(
                            fontFamily: Fontes.raleway,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          event.nomeEvento,
                          style: TextStyle(
                            fontFamily: Fontes.raleway,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Cores.azul1E88E5,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          event.dataEvento,
                          style: const TextStyle(
                            fontFamily: Fontes.inter,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          event.horario,
                          style: const TextStyle(
                            fontFamily: Fontes.inter,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 8),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Cores.brancoCinzento,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            minimumSize: const Size(80, 28),
                            side: const BorderSide(color: Cores.azul42A5F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const InfoEventoPendentes(),
                                type: PageTransitionType.bottomToTop,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.edit_outlined, size: 14, color: Cores.azul42A5F5),
                              SizedBox(width: 6),
                              Text(
                                "Editar",
                                style: TextStyle(
                                  fontFamily: Fontes.raleway,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Cores.azul42A5F5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.network(
                      urlImage + event.imagemEvento,
                      height: 160,
                      width: 130,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 160,
                        width: 130,
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.image, color: Colors.grey),
                      ),
                    ),
                    if (event.logoEvento.isNotEmpty)
                      Container(
                        width: 130,
                        height: 30,
                        color: Colors.black.withOpacity(0.5),
                        alignment: Alignment.center,
                        child: Image.network(
                          urlImage + event.logoEvento,
                          height: 20,
                          fit: BoxFit.contain,
                          errorBuilder: (context, _, __) => const SizedBox(),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
