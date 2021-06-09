import 'dart:convert';
import 'package:clinica/models/personalatencion.dart';
import 'package:clinica/pages/personalatencionadd.dart';
import 'package:clinica/requests/configurl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clinica/pages/perfilpersonalatencion.dart';
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'citaview.dart';
import 'menuadministrador.dart';
import 'pacienteview.dart';

Future<List<PersonalAtencion>> listarPost(http.Client client) async {

  final response = await http.get(Uri.parse(
      Url+'GetDataPersonalAtencion.php'));

  return compute(pasaraListas, response.body);
}
List<PersonalAtencion> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<PersonalAtencion>((json) => PersonalAtencion.fromJson(json)).toList();
}
void main() {
  runApp(ListPersonalAtencion());
}
class ListPersonalAtencion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Personal de atención',
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: <String, WidgetBuilder>{
        "/Paciente": (BuildContext context) => ListPaciente(),
        "/Cita": (BuildContext context) => ListCitas(),
        "/Menu": (BuildContext context) => MenuAdministrador(),
      },
      home: MyHomePage(title: 'Personal de atención',),

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
  int selectedIndex = 0;
  final _bgColor = Color(0xFFF6F6F6);
  void initState() {
    super.initState();
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
              tooltip: 'Volver al menu',
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
        title: Text('Personal de atención'),
        actions: [
          IconButton(
              tooltip: 'Registrar personal',
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddPersonalAtencion()
                  ),
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
          Icons.assignment_ind_outlined,
          Icons.home,
          Icons.accessibility_new_rounded,
          Icons.article_outlined,
        ],
        highlightedIcons: [
          Icons.assignment_ind_outlined,
          Icons.home,
          Icons.accessibility_new_rounded,
          Icons.article_outlined,
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
            if(selectedIndex==1){
              Navigator.pushNamed(context, "/Menu");
            }
            if(selectedIndex==2){
              Navigator.pushNamed(context, "/Paciente");
            }
            if(selectedIndex==3){
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
    future: listarPost(http
        .Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.data != null
              ? VistaPersonal(listapersonal: snapshot.data)
              : Text('No hay datos en el sistema');
        default:
          return Text('Presione el boton para actualizar');
      }
    },
  );
}

class VistaPersonal extends StatelessWidget {
  final List<PersonalAtencion> listapersonal;
  const VistaPersonal({Key? key, required this.listapersonal}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: listapersonal == null ? 0 : listapersonal.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PerfilPersonalAtencion(
                          perfilpaci: listapersonal, idperfilpc: posicion)
                  )
              );
            },

            /*leading: Container(
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
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),*/

            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: Image.network(listapersonal[posicion].Foto),
            ),
            title: Text(listapersonal[posicion].Nombres),
            subtitle: Text(listapersonal[posicion].Apellidos),
            trailing: Container(
              width: 80,
              height: 40,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(listapersonal[posicion].Estado),
              color:
              listapersonal[posicion].Estado == 'Activo'
                  ? Colors.lightGreenAccent
                  : Colors.red,
            ),
          );
        });
  }
}