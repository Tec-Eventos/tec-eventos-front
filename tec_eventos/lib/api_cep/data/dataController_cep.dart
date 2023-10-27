import 'package:br_api/br_api.dart';

callCep(cep) async {
  final buscando_cep = await CepV2.searchCepV2(cep: cep);

  return "${buscando_cep.street}, ${buscando_cep.neighborhood} - ${buscando_cep.city}-${buscando_cep.state}";
}
