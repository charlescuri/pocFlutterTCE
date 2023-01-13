import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todospring/Services/database_services.dart';
import 'package:todospring/models/cliente.dart';
import 'package:todospring/models/clientes_data.dart';

import '../cliente_tile.dart';
import 'add_cliente_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Cliente>? clientes;

  getClientes() async {
    clientes = await DatabaseServices.getClientes();
    Provider.of<ClientesData>(context, listen: false).clientes = clientes!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return clientes == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Clientes TCE-SP(${Provider.of<ClientesData>(context).clientes.length})',
              ),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Consumer<ClientesData>(
                builder: (context, clientesData, child) {
                  return ListView.builder(
                      itemCount: clientesData.clientes.length,
                      itemBuilder: (context, index) {
                        Cliente cliente = clientesData.clientes[index];
                        return ClienteTile(
                          cliente: cliente,
                          clientesData: clientesData,
                        );
                      });
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.add,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const AddClienteScreen();
                    });
              },
            ),
          );
  }
}
