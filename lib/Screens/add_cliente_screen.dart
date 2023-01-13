import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todospring/models/clientes_data.dart';

class AddClienteScreen extends StatefulWidget {
  const AddClienteScreen({Key? key}) : super(key: key);

  @override
  _AddClienteScreenState createState() => _AddClienteScreenState();
}

class _AddClienteScreenState extends State<AddClienteScreen> {
  String nome = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Adicionar cliente',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.green,
            ),
          ),
          TextField(
            autofocus: true,
            onChanged: (val) {
              nome= val;
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if (nome.isNotEmpty) {
                Provider.of<ClientesData>(context, listen: false)
                    .addCliente(nome);
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Adicionar',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.green),
          ),
        ],
      ),
    );
  }
}
