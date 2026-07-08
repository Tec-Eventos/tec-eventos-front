import 'dart:io';
import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/features/events/domain/repositories/events_repository.dart';

/// Caso de uso encarregado de criar e postar um novo evento.
class PostEventUseCase {
  final IEventsRepository _repository;

  PostEventUseCase(this._repository);

  /// Executa o cadastro do novo evento delegando as imagens e o QR Code ao repositório.
  Future<void> execute({
    required AppEvent event,
    required File imagePrincipal,
    required File imageLogo,
    required String qrCode,
  }) async {
    return await _repository.postEvent(
      event: event,
      imagePrincipal: imagePrincipal,
      imageLogo: imageLogo,
      qrCode: qrCode,
    );
  }
}
