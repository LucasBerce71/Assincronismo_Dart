import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<void> run() async {
  var url = 'https://viacep.com.br/ws/99999140/json/';
  var response = await http.get(url);

  print('STATUS_CODE GET: ' + response.statusCode.toString());

  if (response.statusCode == 200) {
    var respData = convert.jsonDecode(response.body);

    if (respData['erro'] != null) {
      print('Erro ao buscar endereço!');
    } else {
      print('CEP: ' + respData['cep']);
      print('LOGRADOURO: ' + respData['logradouro']);

      if (respData['complemento'] != '') {
        print('COMPLEMENTO: ' + respData['complemento']);
      }

      print('BAIRRO: ' + respData['bairro']);
      print('LOCALIDADE: ' + respData['localidade']);
      print('UF: ' + respData['uf']);
      print('IBGE: ' + respData['ibge']);
      print('GIA: ' + respData['gia']);
      print('DDD: ' + respData['ddd']);
      print('SIAFI: ' + respData['siafi']);
    }
  }

  Map<String, dynamic> requestSavePost = {
    'title': 'foo',
    'body': 'bar',
    'userId': 1
  };

  var responseSavePost = await http.post(
      'https://jsonplaceholder.typicode.com/posts',
      body: convert.jsonEncode(requestSavePost));

  print('STATUS_CODE POST: ' + responseSavePost.statusCode.toString());
  print(responseSavePost.body);

  Map<String, dynamic> requestUpdatePost = {
    'id': 1,
    'title': 'foo',
    'body': 'bar',
    'userId': 1
  };

  var responseUpdatePost = await http.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      body: convert.jsonEncode(requestUpdatePost));

  print('STATUS_CODE PUT: ' + responseUpdatePost.statusCode.toString());
  print(responseUpdatePost.statusCode);
  print(responseUpdatePost.body);

  var responseDeletePost = await http.delete('https://jsonplaceholder.typicode.com/posts/1');

  print('STATUS_CODE DELETE: ' + responseDeletePost.statusCode.toString());
  print(responseDeletePost.statusCode);
  print(responseDeletePost.body);
}
