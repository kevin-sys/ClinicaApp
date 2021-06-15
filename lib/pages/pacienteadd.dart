import 'package:flutter/material.dart';
import 'package:clinica/requests/pacientehttp.dart';

import 'menuadministrador.dart';

class AddPaciente extends StatefulWidget {
  AddPaciente({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _AddPacienteState createState() => _AddPacienteState();
}

class _AddPacienteState extends State<AddPaciente> {
  final TextEditingController IdentificacionController =
      new TextEditingController();
  final TextEditingController FotoController = new TextEditingController();
  final TextEditingController NombresController = new TextEditingController();
  final TextEditingController ApellidosController = new TextEditingController();
  final TextEditingController FechaNacimientoController =
      new TextEditingController();
  final TextEditingController EdadController = new TextEditingController();
  final TextEditingController DireccionController = new TextEditingController();
  final TextEditingController BarrioController = new TextEditingController();
  final TextEditingController TelefonoController = new TextEditingController();
  final TextEditingController CiudadController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(5.0),
            width: 50,
            height: 50,
            child: IconButton(
                tooltip: 'Ir al menu',
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuAdministrador()),
                  );
                }),
          ),
          title: Text('Registrar paciente'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 20, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              SizedBox(
                height: 2,
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                elevation: 6.0,
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: Form(
                      child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: new TextField(
                            maxLength: 11,
                            controller: IdentificacionController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Identificación',
                              hintText: '1234567890',
                              icon: new Icon(Icons.vpn_key),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 50,
                          child: new TextField(
                            controller: FotoController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Foto',
                              hintText: '',
                              icon: new Icon(Icons.upload),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 50,
                          child: new TextField(
                            controller: NombresController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Nombres',
                              hintText: 'Gissel Daniela',
                              icon: new Icon(Icons.accessibility_new_rounded),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 50,
                          child: new TextField(
                            controller: ApellidosController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Apellidos',
                              hintText: 'Gomez Martinez',
                              icon: new Icon(Icons.accessibility_new_rounded),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 50,
                          child: new TextField(
                            controller: FechaNacimientoController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Fecha de nacimiento',
                              hintText: '01121999',
                              icon: new Icon(Icons.wysiwyg),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 50,
                          child: new TextField(
                            maxLength: 2,
                            controller: EdadController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Edad',
                              hintText: '21',
                              icon: new Icon(Icons.accessibility_new_rounded),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 50,
                          child: new TextField(
                            controller: DireccionController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Dirección',
                              hintText: 'Calle 15-A #24-32',
                              icon: new Icon(Icons.add_location),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 50,
                          child: new TextField(
                            controller: BarrioController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Barrio',
                              hintText: 'Mareigua',
                              icon: new Icon(Icons.add_location),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 50,
                          child: new TextField(
                            maxLength: 10,
                            controller: TelefonoController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Telefono',
                              hintText: '3076539087',
                              icon: new Icon(Icons.call),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 50,
                          child: new TextField(
                            controller: CiudadController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Ciudad',
                              hintText: 'Valledupar',
                              icon: new Icon(Icons.add_location),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 24.0),
                        ),
                        Container(
                          height: 30,
                          child: new RaisedButton(
                            onPressed: () {
                              AdicionarPaciente(
                                IdentificacionController.text.trim(),
                                FotoController.text.trim(),
                                NombresController.text.trim(),
                                ApellidosController.text.trim(),
                                FechaNacimientoController.text.trim(),
                                EdadController.text.trim(),
                                DireccionController.text.trim(),
                                BarrioController.text.trim(),
                                TelefonoController.text.trim(),
                                CiudadController.text.trim(),
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => AddPaciente()));
                            },
                            color: Colors.cyan,
                            child: new Text(
                              'Guardar Paciente',
                              style: new TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
