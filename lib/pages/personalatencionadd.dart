import 'package:flutter/material.dart';
import 'package:clinica/requests/personalatencionhttp.dart';

import 'menuadministrador.dart';



class AddPersonalAtencion extends StatefulWidget {

  AddPersonalAtencion({ Key? key,  this.title}) : super(key: key);
  final String? title;

  @override
  _AddPersonalAtencionState createState() => _AddPersonalAtencionState();
}

class _AddPersonalAtencionState extends State<AddPersonalAtencion> {

  final TextEditingController IdentificacionController = new TextEditingController();
  final TextEditingController FotoController = new TextEditingController();
  final TextEditingController NombresController = new TextEditingController();
  final TextEditingController ApellidosController = new TextEditingController();
  final TextEditingController TipoController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Personal',
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
                        builder: (context) => MenuAdministrador()
                    ),
                  );
                }
            ),
          ),
          title: Text('Registrar personal'),
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
                padding: new EdgeInsets.only(top: 44.0),
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
                padding: new EdgeInsets.only(top: 44.0),
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
                padding: new EdgeInsets.only(top: 44.0),
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
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: TipoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Tipo de personal',
                    hintText: 'Medico',
                    icon: new Icon(Icons.wysiwyg),
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
                    AdicionarPersonal(
                      IdentificacionController.text.trim(),
                      FotoController.text.trim(),
                      NombresController.text.trim(),
                      ApellidosController.text.trim(),
                      TipoController.text.trim(),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AddPersonalAtencion()));
                  },
                  color: Colors.cyan,
                  child: new Text(
                    'Guardar personal de atención',
                    style: new TextStyle(
                        color: Colors.white),
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