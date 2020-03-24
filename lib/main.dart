import 'package:flutter/material.dart';
import 'package:simulador_so/componentes/gerenciador.dart';
import 'package:simulador_so/src/sistema.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 17,
        title: Text(
          "Gerenciamento de Memória".toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 15,
          ),
        ),
      ),
      body: Center(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 17,
          color: Colors.cyan,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SistemaWidget(),
              ),
            );
          },
          child: Text(
            "Iniciar Simulador",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
