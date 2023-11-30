import 'dart:math';

class GeradorDeID {
  Set<int> _idsUtilizados = Set<int>();

  int gerarIDUnico() {
    Random random = Random();
    int novoID;

    do {
      novoID = random.nextInt(1000) + 1;
    } while (_idsUtilizados.contains(novoID));

    _idsUtilizados.add(novoID);
    return novoID;
  }
}
