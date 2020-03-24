class Memoria {
  int tamanhoInicial;
  int tamanhoAtual;
  List<Map<String, dynamic>> processosMem = [];
  int proximoEncaixeIndex = 0;

  instanciaMemoria(tam) {
    this.tamanhoInicial = tam;
    this.tamanhoAtual = tam;

    processosMem.add({
      "nome": "espaço livre",
      "tamanho": tamanhoAtual,
    });
  }

  String carregar(Map<String, dynamic> processo, algoritmo) {
    if (processosMem.length == 1) {
      processosMem.clear();
      processosMem.add(processo);
      print(processosMem.toString());
      tamanhoAtual -= processo["tamanho"];
      processosMem.add({
        "nome": "espaço livre",
        "tamanho": tamanhoAtual,
      });

      print(processosMem.toString());
    } else {
      switch (algoritmo) {
        case 0:
          int count = processosMem.length;

          for (var i = 0; i < count; i++) {
            if (processosMem[i]["nome"] == "espaço livre") {
              if (processosMem[i]["tamanho"] >= processo["tamanho"]) {
                processosMem[i]["tamanho"] -= processo["tamanho"];
                if (processosMem[i]["tamanho"] == 0) {
                  processosMem.removeAt(i);
                }
                processosMem.insert(i, processo);
                tamanhoAtual -= processo["tamanho"];
                proximoEncaixeIndex = i;
                break;
              }
            }
          }

          break;
        case 1:
          int count = processosMem.length;
          // int aux = 0;
          for (var i = proximoEncaixeIndex; i < count; i++) {
            if (processosMem[i]["nome"] == "espaço livre") {
              if (processosMem[i]["tamanho"] >= processo["tamanho"]) {
                processosMem[i]["tamanho"] -= processo["tamanho"];
                if (processosMem[i]["tamanho"] == 0) {
                  processosMem.removeAt(i);
                }
                processosMem.insert(i, processo);
                tamanhoAtual -= processo["tamanho"];
                proximoEncaixeIndex = i;
                break;
              } else if (i == count - 1) {
                //primeiro encaixe
                for (var i = 0; i < count; i++) {
                  if (processosMem[i]["nome"] == "espaço livre") {
                    if (processosMem[i]["tamanho"] >= processo["tamanho"]) {
                      processosMem[i]["tamanho"] -= processo["tamanho"];
                      if (processosMem[i]["tamanho"] == 0) {
                        processosMem.removeAt(i);
                      }
                      processosMem.insert(i, processo);
                      tamanhoAtual -= processo["tamanho"];
                      proximoEncaixeIndex = i;
                      break;
                    }
                  }
                }
              }
            }
          }
          break;
        case 2:
          int count = processosMem.length;
          int aux = 0;
          for (var i = 0; i < count; i++) {
            if (processosMem[i]["nome"] == "espaço livre") {
              if (processosMem[i]["tamanho"] == processo["tamanho"]) {
                processosMem[i]["tamanho"] -= processo["tamanho"];
                if (processosMem[i]["tamanho"] == 0) {
                  processosMem.removeAt(i);
                }
                processosMem.insert(i, processo);
                tamanhoAtual -= processo["tamanho"];
                proximoEncaixeIndex = i;
                aux = 1;
                break;
              }
            }
          }
          if (aux == 1) {
            //primeiro encaixe
            for (var i = 0; i < count; i++) {
              if (processosMem[i]["nome"] == "espaço livre") {
                if (processosMem[i]["tamanho"] >= processo["tamanho"]) {
                  processosMem[i]["tamanho"] -= processo["tamanho"];
                  if (processosMem[i]["tamanho"] == 0) {
                    processosMem.removeAt(i);
                  }
                  processosMem.insert(i, processo);
                  tamanhoAtual -= processo["tamanho"];
                  proximoEncaixeIndex = i;
                  break;
                }
              }
            }
          }

          break;
        case 3:
          int count = processosMem.length;
          int aux = 0;
          int indexAux;
          for (var i = 0; (i < count) && (aux == 0); i++) {
            if (processosMem[i]["nome"] == "espaço livre") {
              indexAux = i;
              aux = 1;
            }
          }

          for (var i = 0; i < count; i++) {
            if (processosMem[i]["nome"] == "espaço livre") {
              if (processosMem[i]["tamanho"] >
                  processosMem[indexAux]["tamanho"]) indexAux = i;
            }
          }

          processosMem[indexAux]["tamanho"] -= processo["tamanho"];
          if (processosMem[indexAux]["tamanho"] == 0) {
            processosMem.removeAt(indexAux);
          }
          processosMem.insert(indexAux, processo);
          tamanhoAtual -= processo["tamanho"];
          proximoEncaixeIndex = indexAux;

          break;

          break;
        default:
      }
    }

    return "";
  }

  String remover(nome) {
    for (var i = 0; i < processosMem.length; i++) {
      if (processosMem[i]["nome"] == nome) {
        Map processoAux = processosMem[i];

        processosMem.removeAt(i);
        tamanhoAtual += processoAux["tamanho"];
        processoAux["nome"] = "espaço livre";
        processosMem.insert(i, processoAux);

        if (processosMem[i]["nome"] == "espaço livre") {
          //   Map processoAux2 = processosMem[i + 1];
          //   processosMem.remove(processosMem[i + 1]);
          //   tamanhoAtual += processoAux2["tamanho"];
          //   processosMem.insert(i, {
          //     "nome": "espaço livre",
          //     "tamanho": processoAux2["tamanho"] + processoAux["tamanho"]
          //   });
          // } else {

        }

        // if (processosMem[i - 1]["nome"] == "espaço livre") {
        //   Map processoAux2 = processosMem[i - 1];
        //   processosMem.remove(processosMem[i - 1]);

        //   processosMem.insert(i - 1, {
        //     "nome": "espaço livre",
        //     "tamanho": processoAux2["tamanho"] + processoAux["tamanho"]
        //   });
        //

        return "";
      }
    }
  }
}
