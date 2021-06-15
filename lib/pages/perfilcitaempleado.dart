import 'package:clinica/models/cita.dart';
import 'package:flutter/material.dart';
import 'citaedit.dart';

var contextoppal;

class PerfilCitaEmpleado extends StatelessWidget {
  final idperfilcita;
  final List<Citas> perfilcitas;
  PerfilCitaEmpleado({Key? key, required this.perfilcitas, this.idperfilcita});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citas',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detalles de la cita'),
          actions: [
            IconButton(
                tooltip: 'Detalle cita',
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ModificarCita(
                              perfilcita: perfilcitas,
                              idperfilcita: idperfilcita)));
                }),
          ],
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            height: 550,
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
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text('Datos del paciente',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.cyan)),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Identificacion'),
                                      Text(
                                        perfilcitas[idperfilcita]
                                            .IdentificacionPaciente,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Nombres'),
                                      Text(
                                        perfilcitas[idperfilcita]
                                            .NombresPaciente,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Apellidos'),
                                      Text(perfilcitas[idperfilcita]
                                          .ApellidosPaciente),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Datos del personal de atención',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.cyan)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Identificacion'),
                                      Text(
                                        perfilcitas[idperfilcita]
                                            .IdentificacionPersonal,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Nombres'),
                                      Text(
                                        perfilcitas[idperfilcita]
                                            .NombresPersonal,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Apellidos'),
                                      Text(perfilcitas[idperfilcita]
                                          .ApellidosPersonal),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Tipo'),
                                      Text(
                                        perfilcitas[idperfilcita].TipoPersonal,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Datos de la cita',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.cyan)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Codigo'),
                                      Text(
                                        perfilcitas[idperfilcita].CodigoCita,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Hora'),
                                      Text(
                                        perfilcitas[idperfilcita].HoraCita,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Fecha'),
                                      Text(
                                        perfilcitas[idperfilcita].FechaCita,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 40,
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          perfilcitas[idperfilcita].EstadoCita,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        color: perfilcitas[idperfilcita]
                                                    .EstadoCita ==
                                                'No atendido'
                                            ? Colors.red
                                            : Colors.lightGreenAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Observación',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.cyan)),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                width: 700,
                                height: 100,
                                child:
                                    Text(perfilcitas[idperfilcita].Observacion),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Volver al listado',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white))),
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
        ]),
      ),
    );
  }
}
