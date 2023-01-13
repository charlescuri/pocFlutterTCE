import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todospring/models/cliente.dart';

import 'globals.dart';

class DatabaseServices {
  static Future<Cliente> addCliente(String nome) async {
    Map data = {
      "nome": nome,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/add');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    Cliente cliente = Cliente.fromMap(responseMap);

    return cliente;
  }

  static Future<List<Cliente>> getClientes() async {
    var url = Uri.parse(baseURL);
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    List responseList = jsonDecode(response.body);
    List<Cliente> clientes = [];
    for (Map clienteMap in responseList) {
      Cliente cliente = Cliente.fromMap(clienteMap);
      clientes.add(cliente);
    }
    return clientes;
  }

  static Future<http.Response> updateCliente(int id) async {
    var url = Uri.parse(baseURL + '/update/$id');
    http.Response response = await http.put(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> deleteCliente(int id) async {
    var url = Uri.parse(baseURL + '/delete/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }
}
