import 'dart:io';
import 'package:tec_eventos/core/network/http_client.dart';
import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/features/events/domain/repositories/events_repository.dart';

/// Implementação concreta do repositório de eventos.
///
/// Integra-se com a API REST remota realizando consultas e multipart uploads.
class EventsRepositoryImpl implements IEventsRepository {
  final IHttpClient _httpClient;

  /// Inicializa o repositório injetando o cliente HTTP.
  EventsRepositoryImpl(this._httpClient);

  @override
  Future<List<AppEvent>> getAlunoEvents(int rmAluno) async {
    final response = await _httpClient.get('/aluno/events/$rmAluno');
    final List<AppEvent> events = [];

    if (response is Map && response.containsKey('data')) {
      final List dataList = response['data'];
      for (final item in dataList) {
        events.add(AppEvent.fromMap(item));
      }
    }
    return events;
  }

  @override
  Future<List<AppEvent>> getEscolaEvents(int cdInstituicao) async {
    final response = await _httpClient.get('/escola/events/$cdInstituicao');
    final List<AppEvent> events = [];

    if (response is Map && response.containsKey('data')) {
      final List dataList = response['data'];
      for (final item in dataList) {
        events.add(AppEvent.fromMap(item));
      }
    }
    return events;
  }

  @override
  Future<void> postEvent({
    required AppEvent event,
    required File imagePrincipal,
    required File imageLogo,
    required String qrCode,
  }) async {
    // 1. Cadastra o CEP do endereço primeiro
    final cepInt = int.tryParse(event.cepEvento.replaceAll(RegExp(r'\D'), '')) ?? 0;
    final cepBody = {
      "cep": cepInt,
      "logradouro": '',
      "complemento": '',
      "bairro": '',
      "cidade": '',
      "estado": '',
    };
    try {
      await _httpClient.post('/endereco', data: cepBody);
    } catch (_) {
      // Ignora falhas se o CEP já estiver cadastrado
    }

    // 2. Posta a entidade do Evento
    final eventBody = {
      "cd_evento": event.cdEvento,
      "cd_instituicao": event.cdInstituicao,
      "nome_evento": event.nomeEvento,
      "data_evento": event.dataEvento,
      "horario": event.horario,
      "quantidade_ingressos": event.quantidadeIngressos,
      "descricao": event.descricao,
      "cep": event.cepEvento,
      "senha": event.senhaEvento,
      "preco": event.preco,
    };
    await _httpClient.post('/event', data: eventBody);

    // 3. Faz o upload da imagem principal (principal = 1)
    await _httpClient.postMultipart(
      '/upload',
      fields: {
        "cd_evento": event.cdEvento,
        "principal": 1,
        "logo_evento": 0,
      },
      files: {
        "imagem": imagePrincipal,
      },
    );

    // 4. Faz o upload do logotipo do evento (principal = 0, logo_evento = 1)
    await _httpClient.postMultipart(
      '/upload',
      fields: {
        "cd_evento": event.cdEvento,
        "principal": 0,
        "logo_evento": 1,
      },
      files: {
        "imagem": imageLogo,
      },
    );

    // 5. Cadastra o QR Code vinculado ao evento
    final qrcodeBody = {
      "cd_evento": event.cdEvento,
      "valor_qr": qrCode,
    };
    await _httpClient.post('/qrcode', data: qrcodeBody);
  }
}
