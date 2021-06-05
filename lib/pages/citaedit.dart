import 'package:clinica/models/cita.dart';
import 'package:clinica/requests/citahttp.dart';
import 'package:flutter/material.dart';

class ModificarCita extends StatefulWidget {
  final idperfilcita;
  final List<Citas> perfilcita;
  ModificarCita({Key? key, required this.perfilcita, this.idperfilcita});

  @override
  _ModificarCitaState createState() => _ModificarCitaState();
}

class _ModificarCitaState extends State<ModificarCita> {
  TextEditingController ControlCodigoCita = TextEditingController();
  TextEditingController ControlEstado = TextEditingController();
  TextEditingController ControlObservacion = TextEditingController();

  String? IdentificacionPaciente;
  String? NombresPaciente;
  String? ApellidosPaciente;

  @override
  void initState() {
    ControlCodigoCita =
        TextEditingController(text: widget.perfilcita[widget.idperfilcita].CodigoCita);
    ControlEstado =
        TextEditingController(text: widget.perfilcita[widget.idperfilcita].EstadoCita);
    ControlObservacion =
        TextEditingController(text: widget.perfilcita[widget.idperfilcita].Observacion);

    IdentificacionPaciente =
        widget.perfilcita[widget.idperfilcita].IdentificacionPaciente;
    NombresPaciente = widget.perfilcita[widget.idperfilcita].NombresPaciente;
    ApellidosPaciente = widget.perfilcita[widget.idperfilcita].ApellidosPaciente;



    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar cita"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: ControlCodigoCita,
                decoration: InputDecoration(labelText: "Codigo de la cita"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Identificacion'),
                      Text(
                        IdentificacionPaciente!,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Nombres'),
                      Text(
                        NombresPaciente!,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Apellidos'),
                      Text(ApellidosPaciente!),
                    ],
                  )
                ],
              ),
              TextField(
                controller: ControlEstado,
                decoration: InputDecoration(labelText: "Estado de la cita"),
              ),
              TextField(
                controller: ControlObservacion,
                decoration: InputDecoration(labelText: "Observación"),
              ),
              ElevatedButton(
                child: Text("Modificar cita"),
                onPressed: () {
                  EditarCita(
                      widget.perfilcita[widget.idperfilcita].CodigoCita,
                      ControlEstado.text,
                      ControlObservacion.text);

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
