import 'package:flutter_test/flutter_test.dart';
import 'package:tec_eventos/features/ingressos/data/repositories/tickets_repository_impl.dart';

void main() {
  late TicketsRepositoryImpl repository;

  setUp(() {
    repository = TicketsRepositoryImpl();
  });

  test('deve retornar a lista contendo o ingresso personalizado com as informacoes do usuario', () async {
    const userName = 'Gabriel Felix';
    const userRole = 'Aluno';

    final result = await repository.getTickets(
      userName: userName,
      userRole: userRole,
    );

    expect(result, isNotEmpty);
    expect(result.length, 1);
    expect(result[0].userName, userName);
    expect(result[0].userRole, userRole);
    expect(result[0].eventName, 'V Encontro de Tecnologia');
    expect(result[0].qrcodeData, 'PRESENCA-$userName');
  });
}
