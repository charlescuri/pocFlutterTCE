import 'package:flutter/cupertino.dart';
import 'package:todospring/Services/database_services.dart';
import 'package:todospring/models/cliente.dart';

class ClientesData extends ChangeNotifier {
  List<Cliente> clientes = [];

  void addCliente(String nome) async {
    Cliente cliente = await DatabaseServices.addCliente(nome);
    clientes.add(cliente);
    notifyListeners();
  }

  void updateCliente(Cliente cliente) {
    cliente.toggle();
    DatabaseServices.updateCliente(cliente.id);
    notifyListeners();
  }

  void deleteCliente(Cliente cliente) {
    clientes.remove(cliente);
    DatabaseServices.deleteCliente(cliente.id);
    notifyListeners();
  }
}
