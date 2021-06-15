import 'dart:convert';
import 'package:clinica/pages/perfilcitaempleado.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clinica/models/cita.dart';
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:clinica/requests/configurl.dart';

String Id = '';
String Name = '';


Future<List<Citas>> ListarCitas(http.Client client, Id, Name) async {
  final response = await http.post(Uri.parse(Url + 'FindCitaId.php'), body: {
    "IdentificacionPersonal": Id,
  });
  return compute(pasarcitalista, response.body);
}

List<Citas> pasarcitalista(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Citas>((json) => Citas.fromJson(json)).toList();
}

class BusquedaCitas extends StatelessWidget {
  String idUsuario = '';
  String nameUsuario = '';


  BusquedaCitas({required this.idUsuario, nameUsuario});
  factory BusquedaCitas.Asignar(Map JsonMap) {
    Id = JsonMap['idUsuario'];
    Name = JsonMap['nameUsuario'];
    return BusquedaCitas(idUsuario: JsonMap[Id],nameUsuario: JsonMap[Name]);
  }

  @override
  Widget build(BuildContext context) {
    Id = idUsuario;
    Name=nameUsuario;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citas del personal ' + Name,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: MyHomePage(
        title: 'Citas',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Citas Agendadas'+Name),
      ),
      body: getInfo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getInfo(context);
          });
        },
        tooltip: 'Actualizar',
        child: Icon(Icons.refresh),
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: ListarCitas(http.Client(), Id,Name),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.data != null
              ? VistaCitas(citas: snapshot.data)
              : Text(
                  'No hay datos',
                  style: TextStyle(color: Colors.black),
                );

        default:
          return Text('Actualizar');
      }
    },
  );
}

class VistaCitas extends StatelessWidget {
  List<Citas> citas;

  VistaCitas({Key? key, required this.citas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: citas == null ? 0 : citas.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PerfilCitaEmpleado(
                          perfilcitas: citas, idperfilcita: posicion)));
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 140,
              height: 120,
              child: Text("Fecha de la cita " + citas[posicion].FechaCita),
            ),
            title: Text(
                "Identificación: " + citas[posicion].IdentificacionPaciente),
            subtitle: Text("Nombre: " +
                citas[posicion].NombresPaciente +
                " " +
                citas[posicion].ApellidosPaciente),
            trailing: Container(
              width: 130,
              height: 40,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(citas[posicion].EstadoCita),
              color: citas[posicion].EstadoCita == 'No atendido'
                  ? Colors.red
                  : Colors.lightGreenAccent,
            ),
          );
        });
  }
}
