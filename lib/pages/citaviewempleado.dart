import 'dart:convert';
import 'package:clinica/pages/perfilcita.dart';
import 'package:clinica/pages/personalatencionview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clinica/models/cita.dart';
import 'citaadd.dart';
import 'menuadministrador.dart';
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'pacienteview.dart';
import 'package:clinica/requests/configurl.dart';


Future<List<Citas>> ListarCitas(http.Client client) async {
  final response = await http
      .get(Uri.parse(Url+'GetDataCita.php'));
  return compute(pasarcitalista, response.body);
}

List<Citas> pasarcitalista(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Citas>((json) => Citas.fromJson(json)).toList();
}

void main() {
  runApp(ListCitas());
}

class ListCitas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citas',
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: <String, WidgetBuilder>{
        "/Cita": (BuildContext context) => AddCita(),
        "/Menu": (BuildContext context) => MenuAdministrador(),
        "/ListadoPaciente": (BuildContext context) => ListPaciente(),
        "/ListadoPersonal": (BuildContext context) => ListPersonalAtencion(),
      },
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
        title: Text('Citas Agendadas'),
        actions: [
          IconButton(
              tooltip: 'Apartar citas',
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCita()),
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
          Icons.article_outlined,
          Icons.home,
          Icons.accessibility_new_rounded,
          Icons.assignment_ind_outlined,

          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.article_outlined,
          Icons.home,
          Icons.accessibility_new_rounded,
          Icons.assignment_ind_outlined,

          // Icons.settings,
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
            if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/Menu");
            }
            if (selectedIndex == 2) {
              Navigator.pushNamed(context, "/ListadoPaciente");
            }
            if (selectedIndex == 3) {
              Navigator.pushNamed(context, "/ListadoPersonal");
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
    future: ListarCitas(http.Client()),
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
                      builder: (BuildContext context) => PerfilCita(
                          perfilcitas: citas, idperfilcita: posicion)));
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 110,
              height: 80,
              child: Text("Fecha de la cita " + citas[posicion].FechaCita),
            ),
            title: Text(
                "Identificación: " + citas[posicion].IdentificacionPaciente),
            subtitle: Text("Nombre: " +
                citas[posicion].NombresPaciente +
                " " +
                citas[posicion].ApellidosPaciente),
            trailing: Container(
              width: 100,
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
