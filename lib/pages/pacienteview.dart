import 'dart:convert';
import 'package:clinica/pages/personalatencionview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clinica/models/paciente.dart';
import 'citaadd.dart';
import 'citaview.dart';
import 'menuadministrador.dart';
import 'pacienteadd.dart';
import 'perfilpaciente.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:clinica/requests/configurl.dart';


Future<List<Paciente>> ListarPaciente(http.Client client) async {
  final response = await http
      .get(Uri.parse(Url+'GetDataPaciente.php'));
  return compute(pasarpacienteaLista, response.body);
}

List<Paciente> pasarpacienteaLista(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Paciente>((json) => Paciente.fromJson(json)).toList();
}

void main() {
  runApp(ListPaciente());
}

class ListPaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pacientes',
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: <String, WidgetBuilder>{
        "/Personal": (BuildContext context) => ListPersonalAtencion(),
        "/Cita": (BuildContext context) => ListCitas(),
        "/Menu": (BuildContext context) => MenuAdministrador(),
      },
      home: MyHomePage(
        title: 'Personal de atención',
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

  int selectedIndex = 0;
  final _bgColor = Color(0xFFF6F6F6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(5.0),
          width: 50,
          height: 50,
          child: IconButton(
              tooltip: 'Volver al menu',
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuAdministrador()),
                );
              }),
        ),
        title: Text('Pacientes'),
        actions: [
          IconButton(
              tooltip: 'Registrar Paciente',
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPaciente()),
                );
              }),
        ],
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
      bottomNavigationBar: AwesomeBottomNav(
        icons: [
          Icons.accessibility_new_rounded,
          Icons.home,
          Icons.assignment_ind_outlined,
          Icons.article_outlined,
          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.accessibility_new_rounded,
          Icons.home,
          Icons.assignment_ind_outlined,
          Icons.article_outlined,
          // Icons.settings,
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
            if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/Menu");
            }
            if (selectedIndex == 2) {
              Navigator.pushNamed(context, "/Personal");
            }
            if (selectedIndex == 3) {
              Navigator.pushNamed(context, "/Cita");
            }
          });
        },
        bodyBgColor: _bgColor,
        highlightColor: Color(0xFF00D0D0),
        navFgColor: Colors.grey,
        navBgColor: Colors.white,
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: ListarPaciente(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.data != null
              ? VistaPacientes(pacientes: snapshot.data)
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

class VistaPacientes extends StatelessWidget {
  List<Paciente> pacientes;

  VistaPacientes({Key? key, required this.pacientes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pacientes == null ? 0 : pacientes.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PerfilPaciente(
                          pacientes: pacientes, idperfilpaciente: posicion)));
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: Image.network(pacientes[posicion].Foto),
            ),
            title: Text(pacientes[posicion].Nombres),
            subtitle: Text(pacientes[posicion].Apellidos),
            trailing: Container(
              width: 80,
              height: 40,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(pacientes[posicion].Estado),
              color: pacientes[posicion].Estado == 'Activo'
                  ? Colors.lightGreenAccent
                  : Colors.red,
            ),
          );
        });
  }
}
