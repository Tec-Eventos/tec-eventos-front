import 'dart:convert';
import 'package:tec_eventos/api_cep/data/api_cep.dart';
import 'package:tec_eventos/api_cep/model/cep_model.dart';



class CepController{
final api_cep = API();

Future<CEP?> getCEP (String cep) async{
  try{
    final response = await api_cep.get("https://viacep.com.br/ws/${cep}/json/");
    print(response?.data.toString());
   if(response?.statusCode == 200){
      return CEP.fromJson(json.decode(json.encode(response?.data)));
    }
  } catch (e) {

    rethrow;
  }
  }
}
