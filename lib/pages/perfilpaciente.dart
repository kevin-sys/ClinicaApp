import 'package:clinica/models/paciente.dart';
import 'package:clinica/requests/pacientehttp.dart';
import 'package:flutter/material.dart';

import 'pacienteedit.dart';

var contextoPaciente;

class PerfilPaciente extends StatelessWidget {
  final idperfilpaciente;
  final List<Paciente> pacientes;
  PerfilPaciente({Key? key, required this.pacientes, this.idperfilpaciente});

  @override
  Widget build(BuildContext context) {
    contextoPaciente = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil del paciente',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Paciente'),
          actions: [
            IconButton(
                tooltip: 'Modificar',
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ModificarPaciente(
                              perfil: pacientes, idperfil: idperfilpaciente)));
                }),
            IconButton(
                tooltip: 'Eliminar',
                icon: Icon(Icons.delete),
                onPressed: () {
                  confirmarliminar(
                      context, pacientes[idperfilpaciente].Identificacion);
                })
          ],
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            height: 460,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: (MediaQuery.of(context).size.width / 2) - 55,
                    child: Container(
                      height: 100,
                      width: 100,
                      //color: Colors.blue,

                      child: Card(
                        elevation: 2,
                        child: Image.network(pacientes[idperfilpaciente].Foto),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Identificación',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(
                                        pacientes[idperfilpaciente]
                                            .Identificacion,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Nombres',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(
                                        pacientes[idperfilpaciente].Nombres,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Apellidos',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(pacientes[idperfilpaciente]
                                          .Apellidos),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Fecha de nacimiento',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(pacientes[idperfilpaciente]
                                          .FechaNacimiento),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Edad',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(pacientes[idperfilpaciente].Edad),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Telefono',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(
                                          pacientes[idperfilpaciente].Telefono),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Dirección',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(pacientes[idperfilpaciente]
                                          .Direccion),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Barrio',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(pacientes[idperfilpaciente].Barrio),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Ciudad',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(pacientes[idperfilpaciente].Ciudad),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Fecha de registro',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(pacientes[idperfilpaciente]
                                          .FechaRegistro),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Estado',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Container(
                                        width: 90,
                                        height: 40,
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          pacientes[idperfilpaciente].Estado,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        color: pacientes[idperfilpaciente]
                                                    .Estado ==
                                                'Activo'
                                            ? Colors.lightGreenAccent
                                            : Colors.red,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver al listado',
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ]),
      ),
    );
  }
}

void confirmarliminar(context, IdentificacionEliminar) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text('¿Esta seguro de eliminar?'),
        actions: <Widget>[
          ElevatedButton(
            child: Icon(Icons.cancel),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepOrange),
            ),
            child: Icon(Icons.check_circle),
            onPressed: () {
              EliminarPaciente(IdentificacionEliminar);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
