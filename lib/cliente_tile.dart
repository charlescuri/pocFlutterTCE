import 'package:flutter/material.dart';

import 'models/cliente.dart';
import 'models/clientes_data.dart';

class ClienteTile extends StatelessWidget {
  final Cliente cliente;
  final ClientesData clientesData;

  const ClienteTile({Key? key, required this.cliente, required this.clientesData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          activeColor: Colors.green,
          value: cliente.done,
          onChanged: (checkbox) {
            clientesData.updateCliente(cliente);
          },
        ),
        title: Text(
          cliente.nome,
          style: TextStyle(
            decoration:
                cliente.done ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            clientesData.deleteCliente(cliente);
          },
        ),
      ),
    );
  }
}
