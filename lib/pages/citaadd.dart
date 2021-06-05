import 'dart:convert';
import 'package:clinica/requests/citahttp.dart';
import 'package:clinica/requests/configurl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'menuadministrador.dart';

void main() => runApp(AddCita());

class AddCita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citas',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CitaPage(),
    );
  }
}

class CitaPage extends StatefulWidget {
  @override
  _CitaPageState createState() => _CitaPageState();
}

class _CitaPageState extends State<CitaPage> {
  TextEditingController IdentificacionPaciente = new TextEditingController();
  TextEditingController NombresPaciente = new TextEditingController();
  TextEditingController ApellidosPaciente = new TextEditingController();

  TextEditingController IdentificacionPersonal = new TextEditingController();
  TextEditingController NombresPersonal = new TextEditingController();
  TextEditingController ApellidosPersonal = new TextEditingController();
  TextEditingController TipoPersonal = new TextEditingController();
  TextEditingController Hora = new TextEditingController();
  TextEditingController Fecha = new TextEditingController();
  TextEditingController CodigoCita = new TextEditingController();

  String mensajePaciente = '';
  String mensajePersonal = '';

  Future<List> BuscarPaciente() async {
    final response = await http.post(
        Uri.parse(
            Url+'FindPacienteId.php'),
        body: {
          "Identificacion": IdentificacionPaciente.text,
        });
    var datapaciente = json.decode(response.body);
    if (datapaciente.length == 0) {
      setState(() {
        mensajePaciente = "¡No existe paciente!";
      });
    } else {
      print(datapaciente);
      setState(() {
        IdentificacionPaciente =
            TextEditingController(text: datapaciente[0]['Identificacion']);
        NombresPaciente =
            TextEditingController(text: datapaciente[0]['Nombres']);
        ApellidosPaciente =
            TextEditingController(text: datapaciente[0]['Apellidos']);
        mensajePaciente = "Paciente encontrado";
      });
    }
    return datapaciente;
  }

  Future<List> BuscarPersonal() async {
    final response = await http.post(
        Uri.parse(
            Url+'FindPersonalId.php'),
        body: {
          "Identificacion": IdentificacionPersonal.text,
        });
    var datapersonal = json.decode(response.body);
    if (datapersonal.length == 0) {
      setState(() {
        mensajePersonal = "¡No existe personal de atención!";
      });
    } else {
      print(datapersonal);
      setState(() {
        IdentificacionPersonal =
            TextEditingController(text: datapersonal[0]['Identificacion']);
        NombresPersonal =
            TextEditingController(text: datapersonal[0]['Nombres']);
        ApellidosPersonal =
            TextEditingController(text: datapersonal[0]['Apellidos']);
        TipoPersonal = TextEditingController(text: datapersonal[0]['Tipo']);
        mensajePersonal = "Trabajador encontrado";
      });
    }
    return datapersonal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  MaterialPageRoute(builder: (context) => MenuAdministrador()),
                );
              }),
        ),
        title: Text('Apartar cita'),
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10),
              Card(
                margin: EdgeInsets.all(10.0),
                elevation: 6.0,
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: Form(
                      child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('Datos de la cita'),
                        SizedBox(height: 5),
                        TextField(
                          controller: CodigoCita,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.vpn_key),
                              labelText: 'Codigo de cita',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  CodigoCita.clear();
                                },
                              )),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: Hora,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.access_alarm_rounded),
                              labelText: 'Hora de la cita',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  Hora.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: Fecha,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.date_range_outlined),
                              labelText: 'Fecha de la cita',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  Fecha.clear();
                                },
                              )),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  )),
                ),
              ),
              SizedBox(height: 10),
              Card(
                margin: EdgeInsets.all(10.0),
                elevation: 6.0,
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: Form(
                      child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('Datos del paciente'),
                        SizedBox(height: 5),
                        TextField(
                          controller: IdentificacionPaciente,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.vpn_key),
                              labelText: 'Identificacion',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  IdentificacionPaciente.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: NombresPaciente,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Nombres',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  NombresPaciente.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: ApellidosPaciente,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.accessibility_sharp),
                              labelText: 'Apellidos',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  ApellidosPaciente.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            BuscarPaciente();
                          },
                          child: Text(
                            'Buscar Paciente',
                            style: new TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          mensajePaciente,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        )
                      ],
                    ),
                  )),
                ),
              ),
              SizedBox(height: 10),
              Card(
                margin: EdgeInsets.all(10.0),
                elevation: 6.0,
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: Form(
                      child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('Datos del personal de atención'),
                        SizedBox(height: 5),
                        TextField(
                          controller: IdentificacionPersonal,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.vpn_key),
                              labelText: 'Identificacion',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  IdentificacionPersonal.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: NombresPersonal,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Nombres',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  NombresPersonal.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: ApellidosPersonal,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.accessibility_sharp),
                              labelText: 'Apellidos',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  ApellidosPersonal.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: TipoPersonal,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.accessibility_sharp),
                              labelText: 'Tipo de personal',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  TipoPersonal.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            BuscarPersonal();
                          },
                          child: Text(
                            'Buscar personal de atención',
                            style: new TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          mensajePersonal,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        )
                      ],
                    ),
                  )),
                ),
              ),
              Container(
                height: 35,
                child: new RaisedButton(
                  onPressed: () {
                    AdicionarCita(
                      CodigoCita.text.trim(),
                      IdentificacionPaciente.text.trim(),
                      NombresPaciente.text.trim(),
                      ApellidosPaciente.text.trim(),
                      IdentificacionPersonal.text.trim(),
                      NombresPersonal.text.trim(),
                      ApellidosPersonal.text.trim(),
                      TipoPersonal.text.trim(),
                      Hora.text.trim(),
                      Fecha.text.trim(),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CitaPage()));
                  },
                  color: Colors.cyan,
                  child: new Text(
                    'Guardar Cita',
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
