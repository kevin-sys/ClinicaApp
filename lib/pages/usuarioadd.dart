import 'package:clinica/requests/usuariohttp.dart';
import 'package:flutter/material.dart';
import 'menuadministrador.dart';

class AddUsuario extends StatefulWidget {
  AddUsuario({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _AddUsuarioState createState() => _AddUsuarioState();
}

class _AddUsuarioState extends State<AddUsuario> {
  final TextEditingController Identificacion = new TextEditingController();
  final TextEditingController Usuario = new TextEditingController();
  final TextEditingController Pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de usuarios',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(5.0),
            width: 50,
            height: 50,
            child: IconButton(
                tooltip: 'Ir a menu',
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuAdministrador()),
                  );
                }),
          ),
          title: Text('Registrar usuarios'),

        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 20, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: Identificacion,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Identificación',
                    hintText: '1234567890',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: Usuario,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    hintText: '',
                    icon: new Icon(Icons.accessibility_new_rounded),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),

              Container(
                height: 50,
                child: new TextField(
                  controller: Pass,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: '456alfa',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: () {
                    AdicionarUsuario(
                      Identificacion.text.trim(),
                      Usuario.text.trim(),
                      Pass.text.trim(),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AddUsuario()));
                  },
                  color: Colors.cyan,
                  child: new Text(
                    'Guardar usuario',
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
