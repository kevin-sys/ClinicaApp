// ignore: import_of_legacy_library_into_null_safe
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:clinica/pages/personalatencionadd.dart';
import 'package:clinica/pages/personalatencionview.dart';
import 'package:flutter/material.dart';

import 'citaadd.dart';
import 'citaview.dart';
import 'pacienteadd.dart';
import 'pacienteview.dart';

void main() {
  runApp(MenuEmpleado());
}

class MenuEmpleado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Principal',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        "/Paciente": (BuildContext context) => AddPaciente(),
        "/Personal": (BuildContext context) => AddPersonalAtencion(),
        "/Cita": (BuildContext context) => AddCita(),
        "/ListadoPaciente": (BuildContext context) => ListPaciente(),
        "/ListadoPersonal": (BuildContext context) => ListPersonalAtencion(),
        "/ListadoCitas": (BuildContext context) => ListCitas(),
      },
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  int selectedIndex = 0;
  final _bgColor = Color(0xFFF6F6F6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 130, bottom: 10, right: 10, left: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/Paciente");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              "Paciente",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/Personal");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text("Personal de atención",
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/Cita");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text("Citas", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/Usuarios");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child:
                                Text("Usuarios", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AwesomeBottomNav(
        icons: [
          Icons.home,
          Icons.accessibility_new_rounded,
          Icons.assignment_ind_outlined,
          Icons.article_outlined,

          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.home,
          Icons.accessibility_new_rounded,
          Icons.assignment_ind_outlined,
          Icons.article_outlined,
          // Icons.settings,
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
            if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/ListadoPaciente");
            }
            if (selectedIndex == 2) {
              Navigator.pushNamed(context, "/ListadoPersonal");
            }
            if (selectedIndex == 3) {
              Navigator.pushNamed(context, "/ListadoCitas");
            }
          });
        },
        bodyBgColor: _bgColor,
        highlightColor: Color(0xFF66BB6A),
        navFgColor: Colors.grey,
        navBgColor: Colors.white,
      ),
    );
  }
}
