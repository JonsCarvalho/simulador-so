import 'package:flutter/material.dart';
import 'package:simulador_so/componentes/gerenciador.dart';

class SistemaWidget extends StatefulWidget {
  SistemaWidget({Key key}) : super(key: key);

  _SistemaWidgetState createState() => _SistemaWidgetState();
}

class _SistemaWidgetState extends State<SistemaWidget> {
  PageController _pageController = new PageController();
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _nome;
  int _tamanho;
  int _algoritmo;
  Gerenciador _gerenciador;
  List _processosMemoria = [];

  Color _color(value) {
    if (value == _tamanho) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color _colorAlg(value) {
    if (value == _algoritmo) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  void initState() {
    setState(() {
      iniciaSistema();
    });

    super.initState();
  }

  _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      if ((_nome != null) && (_tamanho != null)) {
        setState(() {
          _gerenciador.carregar(_nome, _tamanho, _algoritmo);
        });
      }
    }
  }

  _submit2() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      if (_nome != null) {
        setState(() {
          _gerenciador.remover(_nome);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: scaffoldKey,
      debugShowCheckedModeBanner: false,
      home: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Scaffold(
            //appBar: AppBar(),
            backgroundColor: Colors.cyan,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 17,
                    color: Colors.white,
                    onPressed: () {
                      _pageController.jumpToPage(1);
                    },
                    child: Text(
                      "1 - Carregar um programa",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 17,
                    color: Colors.white,
                    onPressed: () {
                      _pageController.jumpToPage(2);
                    },
                    child: Text(
                      "2 - Listar programas",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 17,
                    color: Colors.white,
                    onPressed: () {
                      _pageController.jumpToPage(3);
                    },
                    child: Text(
                      "3 - Remover um programa",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 17,
                    color: Colors.white,
                    onPressed: () {
                      _pageController.jumpToPage(4);
                    },
                    child: Text(
                      "4 - Espaço total disponível",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 17,
                    color: Colors.white,
                    onPressed: () {
                      _pageController.jumpToPage(5);
                    },
                    child: Text(
                      "5 - Estado atual",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 17,
                    color: Colors.white,
                    onPressed: () {
                      _pageController.jumpToPage(6);
                    },
                    child: Text(
                      "6 - Compactar memória",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 17,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "7 - Sair",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Página 1
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _pageController.jumpToPage(0);
                  },
                );
              }),
            ),
            body: ListView(
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextFormField(
                          validator: (s) =>
                              s.isEmpty ? "Coloque um nome" : null,
                          onSaved: (s) => _nome = s,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.only(top: 30, left: 20),
                            hintText: "NOME",
                            prefixIcon: Icon(
                              Icons.sort_by_alpha,
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              letterSpacing: 5,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.cyan,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Radio(
                                    activeColor: Colors.white,
                                    groupValue: _tamanho,
                                    value: 2,
                                    onChanged: (value) {
                                      setState(() {
                                        _tamanho = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    "2M",
                                    style: TextStyle(
                                      color: _color(2),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    activeColor: Colors.white,
                                    groupValue: _tamanho,
                                    value: 4,
                                    onChanged: (value) {
                                      setState(() {
                                        _tamanho = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    "4M",
                                    style: TextStyle(
                                      color: _color(4),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    activeColor: Colors.white,
                                    groupValue: _tamanho,
                                    value: 8,
                                    onChanged: (value) {
                                      setState(() {
                                        _tamanho = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    "8M",
                                    style: TextStyle(
                                      color: _color(8),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    activeColor: Colors.white,
                                    groupValue: _tamanho,
                                    value: 16,
                                    onChanged: (value) {
                                      setState(() {
                                        _tamanho = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    "16M",
                                    style: TextStyle(
                                      color: _color(16),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red,
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        activeColor: Colors.white,
                                        groupValue: _algoritmo,
                                        value: 0,
                                        onChanged: (value) {
                                          setState(() {
                                            _algoritmo = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        "Primeiro Encaixe",
                                        style: TextStyle(
                                          color: _colorAlg(0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        activeColor: Colors.white,
                                        groupValue: _algoritmo,
                                        value: 1,
                                        onChanged: (value) {
                                          setState(() {
                                            _algoritmo = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        "Próximo Encaixe",
                                        style: TextStyle(
                                          color: _colorAlg(1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        activeColor: Colors.white,
                                        groupValue: _algoritmo,
                                        value: 2,
                                        onChanged: (value) {
                                          setState(() {
                                            _algoritmo = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        "Melhor Encaixe",
                                        style: TextStyle(
                                          color: _colorAlg(2),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        activeColor: Colors.white,
                                        groupValue: _algoritmo,
                                        value: 3,
                                        onChanged: (value) {
                                          setState(() {
                                            _algoritmo = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        "Pior Encaixe",
                                        style: TextStyle(
                                          color: _colorAlg(3),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          onPressed: _submit,
                          color: Colors.cyan,
                          splashColor: Colors.black,
                          child: Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Página 2
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _pageController.jumpToPage(0);
                  },
                );
              }),
            ),
            body: Container(
              child: loadProcessos(),
            ),
          ),
          //Página 3
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _pageController.jumpToPage(0);
                  },
                );
              }),
            ),
            body: Container(
              child: removerProcesso(),
            ),
          ),
          //Página 4
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _pageController.jumpToPage(0);
                  },
                );
              }),
            ),
            body: Container(
              child: Text(_gerenciador.espacoTotal().toString()),
            ),
          ),
          //Página 5
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _pageController.jumpToPage(0);
                  },
                );
              }),
            ),
            body: Container(
              child: estadoAtual(),
            ),
          ),
          //Página 6
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _pageController.jumpToPage(0);
                  },
                );
              }),
            ),
            body: Container(
              child: Center(
                child: FlatButton(
                  onPressed: () {
                    showDialogCompactarMemoria();
                  },
                  color: Colors.cyan,
                  splashColor: Colors.black,
                  child: Text(
                    "Compactar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showDialogCompactarMemoria() {
    setState(() {
      _gerenciador.compactar();
    });
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("data"),
        );
      },
    );
  }

  estadoAtual() {
    List estado;
    setState(() {
      estado = _gerenciador.estadoAtual();
    });

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: estado.length,
      itemBuilder: (BuildContext context, index) {
        return Text(estado[index].toString());
      },
    );
  }

  iniciaSistema() {
    setState(() {
      _gerenciador = new Gerenciador();

      _gerenciador.alocar();
    });
  }

  loadProcessos() {
    setState(() {
      _processosMemoria = _gerenciador.listar();
    });

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _processosMemoria.length,
      itemBuilder: (BuildContext context, index) {
        return _processosMemoria[index]["nome"] == "espaço livre"
            ? SizedBox()
            : Text(_processosMemoria[index].toString());
      },
    );
  }

  removerProcesso() {
    setState(() {
      _processosMemoria = _gerenciador.listar();
    });

    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextFormField(
              validator: (e) => e.isEmpty ? "Coloque um nome" : null,
              onSaved: (e) => _nome = e,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black, fontSize: 18),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.only(top: 30, left: 20),
                hintText: "NOME",
                prefixIcon: Icon(
                  Icons.sort_by_alpha,
                  color: Colors.black,
                ),
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  letterSpacing: 5,
                ),
              ),
            ),
            RaisedButton(
              onPressed: _submit2,
              color: Colors.cyan,
              splashColor: Colors.black,
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _showDialog1() {

  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.transparent,
  //         content: Container(
  //           padding: EdgeInsets.all(8),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(20),
  //             color: Colors.white,
  //           ),
  //           height: 200,
  //           child:
  //         ),
  //       );
  //     },
  //   );
  // }

  // _showDialog2() {
  //   List processosMem = _gerenciador.listar();
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.transparent,
  //         content: Container(
  //           padding: EdgeInsets.all(8),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(20),
  //             color: Colors.white,
  //           ),
  //           //height: 200,
  //           child: ListView.builder(
  //             itemCount: processosMem.length,
  //             itemBuilder: (BuildContext context, int index) {
  //               return Text(processosMem[index].toString());
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
