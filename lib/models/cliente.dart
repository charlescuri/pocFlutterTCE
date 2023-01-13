class Cliente {
  final int id;
  final String nome;
  bool done;
  

  Cliente({
    required this.id,
    required this.nome,
    this.done = false,
   
  });

	void toggle() {
  	 done = !done;
  	}

  factory Cliente.fromMap(Map clienteMap) {
    return Cliente(
      id: clienteMap['id'],
      nome: clienteMap['nome'],
    
    );
  }
  
}
