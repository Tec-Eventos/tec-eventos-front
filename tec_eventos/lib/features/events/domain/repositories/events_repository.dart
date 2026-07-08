import 'dart:io';
import 'package:tec_eventos/features/events/domain/entities/app_event.dart';

/// Contrato para o repositório de Eventos.
///
/// Define as assinaturas de leitura de feed para Alunos/Instituições e cadastro de novos eventos.
abstract class IEventsRepository {
  /// Obtém a lista de eventos sugeridos para o Aluno.
  Future<List<AppEvent>> getAlunoEvents(int rmAluno);

  /// Obtém a lista de eventos cadastrados pela Escola/Instituição.
  Future<List<AppEvent>> getEscolaEvents(int cdInstituicao);

  /// Efetua a criação de um novo evento com upload de arquivos de imagem.
  Future<void> postEvent({
    required AppEvent event,
    required File imagePrincipal,
    required File imageLogo,
    required String qrCode,
  });
}
