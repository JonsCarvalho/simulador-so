import 'package:simulador_so/componentes/memoria.dart';

class Gerenciador {
  Memoria _memoria;

  alocar() {
    _memoria = new Memoria();
    _memoria.instanciaMemoria(100);
  }

  carregar(nome, tamanho, algoritmo) {
    Map<String, dynamic> processo = {
      "nome": nome,
      "tamanho": tamanho,
    };

    String retorno;

    print("carregar gerenciador".toUpperCase());

    retorno = _memoria.carregar(processo, algoritmo);

    return retorno;
  }

  List listar() {
    return _memoria.processosMem;
  }

  String remover(nome) {
    return _memoria.remover(nome);
  }

  Map espacoTotal() {
    Map<String, int> espaco = {
      "Espaço Total": _memoria.tamanhoInicial,
      "Espaço Livre": _memoria.tamanhoAtual,
    };
    return espaco;
  }

  List estadoAtual() {
    return _memoria.processosMem;
  }

  compactar() {
    int tam = 0;
    int aux = 10;
    while (aux > 0) {
      for (var i = 0; i < _memoria.processosMem.length; i++) {
        if (_memoria.processosMem[i]["nome"] == "espaço livre") {
          tam += _memoria.processosMem[i]["tamanho"];
          _memoria.processosMem.removeAt(i);
        }
      }
      if (tam > 0) {
        _memoria.processosMem.add({
          "nome": "espaço livre",
          "tamanho": tam,
        });
      }
      tam = 0;
      aux--;
    }
  }
}
