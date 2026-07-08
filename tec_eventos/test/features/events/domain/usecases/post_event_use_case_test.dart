import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/features/events/domain/repositories/events_repository.dart';
import 'package:tec_eventos/features/events/domain/usecases/post_event_use_case.dart';

class MockEventsRepository extends Mock implements IEventsRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(const AppEvent(
      cdEvento: 0,
      nomeEvento: '',
      cdInstituicao: 0,
      dataEvento: '',
      horario: '',
      quantidadeIngressos: 0,
      descricao: '',
      cepEvento: '',
      preco: 0,
      senhaEvento: '',
      instituicao: '',
      tipoInstituicao: '',
      imagemEvento: '',
      logoEvento: '',
    ));
    registerFallbackValue(File(''));
  });

  late MockEventsRepository mockRepository;
  late PostEventUseCase useCase;

  setUp(() {
    mockRepository = MockEventsRepository();
    useCase = PostEventUseCase(mockRepository);
  });

  const tEvent = AppEvent(
    cdEvento: 1,
    nomeEvento: 'Encontro de TI',
    cdInstituicao: 10,
    dataEvento: '2026-10-28',
    horario: '19:30',
    quantidadeIngressos: 150,
    descricao: 'Palestra de Tecnologia',
    cepEvento: '17500000',
    preco: 0.0,
    senhaEvento: '',
    instituicao: 'Etec',
    tipoInstituicao: 'Escola',
    imagemEvento: 'img.png',
    logoEvento: 'logo.png',
  );

  test('deve chamar o repositorio para postar o evento com sucesso', () async {
    // Arrange
    final imagePrincipal = File('img_p.png');
    final imageLogo = File('img_l.png');
    const qrCode = 'my_qrcode';

    when(() => mockRepository.postEvent(
          event: any(named: 'event'),
          imagePrincipal: any(named: 'imagePrincipal'),
          imageLogo: any(named: 'imageLogo'),
          qrCode: any(named: 'qrCode'),
        )).thenAnswer((_) async => {});

    // Act
    await useCase.execute(
      event: tEvent,
      imagePrincipal: imagePrincipal,
      imageLogo: imageLogo,
      qrCode: qrCode,
    );

    // Assert
    verify(() => mockRepository.postEvent(
          event: tEvent,
          imagePrincipal: imagePrincipal,
          imageLogo: imageLogo,
          qrCode: qrCode,
        )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
