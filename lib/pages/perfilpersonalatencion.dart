import 'package:clinica/models/personalatencion.dart';
import 'package:clinica/requests/personalatencionhttp.dart';
import 'package:flutter/material.dart';
import 'package:clinica/pages/personalatencionedit.dart';
var contextoppal;
class PerfilPersonalAtencion extends StatelessWidget {
  final idperfilpc;
  final List<PersonalAtencion> perfilpaci;
  PerfilPersonalAtencion({Key? key, required this.perfilpaci, this.idperfilpc});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal de atención'),
          actions: [
            IconButton(
                tooltip: 'Modificar',
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ModificarPersonalAtencion(
                              perfil: perfilpaci, idperfil: idperfilpc)));
                }),
            IconButton(
                tooltip: 'Eliminar',
                icon: Icon(Icons.delete),
                onPressed: () {
                  confirmaeliminar(context, perfilpaci[idperfilpc].Identificacion);
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
                        child: Image.network(perfilpaci[idperfilpc].Foto),
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
                                      Text('Identificación'),
                                      Text(
                                        perfilpaci[idperfilpc].Identificacion,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Nombres'),
                                      Text(
                                        perfilpaci[idperfilpc].Nombres,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Apellidos'),
                                      Text(perfilpaci[idperfilpc].Apellidos),
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
                                      Text('Tipo'),
                                      Container(
                                        width: 130,
                                        height: 50,
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          perfilpaci[idperfilpc].Tipo,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        color:
                                        perfilpaci[idperfilpc].Tipo == 'Medico'
                                            ? Colors.lightGreenAccent
                                            : Colors.orangeAccent,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Estado'),
                                      Container(
                                        width: 100,
                                        height: 50,
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          perfilpaci[idperfilpc].Estado,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        color:
                                        perfilpaci[idperfilpc].Estado == 'Activo'
                                            ? Colors.lightGreenAccent
                                            : Colors.red,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Trabajando'),
                                      Container(
                                        width: 130,
                                        height: 50,
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          perfilpaci[idperfilpc].Trabajando,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        color:
                                        perfilpaci[idperfilpc].Trabajando == 'Libre'
                                            ? Colors.lightGreenAccent
                                            : Colors.red,
                                      ),
                                    ],
                                  )
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
              child: Text('Volver al listado', style: TextStyle(fontSize: 20,color: Colors.white))),

        ]),
      ),
    );
  }
}

void confirmaeliminar(context, IdentificacionEliminar) {
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
              backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
            ),
            child: Icon(Icons.check_circle),
            onPressed: () {
              EliminarPersonalAtencion(IdentificacionEliminar);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

