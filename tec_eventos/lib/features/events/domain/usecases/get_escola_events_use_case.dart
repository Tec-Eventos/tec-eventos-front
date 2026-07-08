import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/features/events/domain/repositories/events_repository.dart';

/// Caso de uso para obter a lista de eventos promovidos por uma instituição escolar específica.
class GetEscolaEventsUseCase {
  final IEventsRepository _repository;

  GetEscolaEventsUseCase(this._repository);

  /// Consulta os eventos promovidos pela instituição por meio de seu [cdInstituicao].
  Future<List<AppEvent>> execute(int cdInstituicao) async {
    return await _repository.getEscolaEvents(cdInstituicao);
  }
}
