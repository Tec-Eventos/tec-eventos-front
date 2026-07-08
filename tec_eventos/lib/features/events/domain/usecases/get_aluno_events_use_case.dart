import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/features/events/domain/repositories/events_repository.dart';

/// Caso de uso para obter o feed de eventos direcionados a um aluno específico.
class GetAlunoEventsUseCase {
  final IEventsRepository _repository;

  GetAlunoEventsUseCase(this._repository);

  /// Consulta os eventos do aluno por meio do [rmAluno].
  Future<List<AppEvent>> execute(int rmAluno) async {
    return await _repository.getAlunoEvents(rmAluno);
  }
}
