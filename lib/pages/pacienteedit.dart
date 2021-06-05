import 'package:clinica/models/paciente.dart';
import 'package:clinica/requests/pacientehttp.dart';
import 'package:flutter/material.dart';

class ModificarPaciente extends StatefulWidget {
  final idperfil;
  final List<Paciente> perfil;
  ModificarPaciente({Key? key, required this.perfil, this.idperfil});

  @override
  _ModificarPacienteState createState() => _ModificarPacienteState();
}

class _ModificarPacienteState extends State<ModificarPaciente> {
  TextEditingController ControlIdentificacion = TextEditingController();
  TextEditingController ControlFoto = TextEditingController();
  TextEditingController ControlNombres = TextEditingController();
  TextEditingController ControlApellidos = TextEditingController();
  TextEditingController ControlFechaNacimiento = TextEditingController();
  TextEditingController ControlEdad = TextEditingController();
  TextEditingController ControlDireccion = TextEditingController();
  TextEditingController ControlBarrio = TextEditingController();
  TextEditingController ControlTelefono = TextEditingController();
  TextEditingController ControlCiudad = TextEditingController();
  bool Estado = false;
  String? EstadoTxt;

  @override
  void initState() {
    ControlIdentificacion = TextEditingController(
        text: widget.perfil[widget.idperfil].Identificacion);
    ControlFoto =
        TextEditingController(text: widget.perfil[widget.idperfil].Foto);
    ControlNombres =
        TextEditingController(text: widget.perfil[widget.idperfil].Nombres);
    ControlApellidos =
        TextEditingController(text: widget.perfil[widget.idperfil].Apellidos);
    ControlFechaNacimiento = TextEditingController(
        text: widget.perfil[widget.idperfil].FechaNacimiento);
    ControlEdad =
        TextEditingController(text: widget.perfil[widget.idperfil].Edad);
    ControlDireccion =
        TextEditingController(text: widget.perfil[widget.idperfil].Direccion);
    ControlBarrio =
        TextEditingController(text: widget.perfil[widget.idperfil].Barrio);
    ControlTelefono =
        TextEditingController(text: widget.perfil[widget.idperfil].Telefono);
    ControlCiudad =
        TextEditingController(text: widget.perfil[widget.idperfil].Ciudad);
    EstadoTxt = widget.perfil[widget.idperfil].Estado;
    widget.perfil[widget.idperfil].Estado == 'Activo'
        ? Estado = true
        : Estado = false;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar paciente"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: ControlIdentificacion,
                decoration: InputDecoration(labelText: "Identificación"),
              ),
              TextField(
                controller: ControlFoto,
                decoration: InputDecoration(labelText: "Foto"),
              ),
              TextField(
                controller: ControlNombres,
                decoration: InputDecoration(labelText: "Nombres"),
              ),
              TextField(
                controller: ControlApellidos,
                decoration: InputDecoration(labelText: "Apellidos"),
              ),
              TextField(
                controller: ControlFechaNacimiento,
                decoration: InputDecoration(labelText: "Fecha de nacimiento"),
              ),
              TextField(
                controller: ControlEdad,
                decoration: InputDecoration(labelText: "Edad"),
              ),
              TextField(
                controller: ControlDireccion,
                decoration: InputDecoration(labelText: "Dirección"),
              ),
              TextField(
                controller: ControlBarrio,
                decoration: InputDecoration(labelText: "Barrio"),
              ),
              TextField(
                controller: ControlTelefono,
                decoration: InputDecoration(labelText: "Telefono"),
              ),
              TextField(
                controller: ControlCiudad,
                decoration: InputDecoration(labelText: "Ciudad"),
              ),
              SwitchListTile(
                title: Text('Estado'),
                value: Estado,
                onChanged: (bool value) {
                  setState(() {
                    Estado = value;
                  });
                },
              ),
              ElevatedButton(
                child: Text("Modificar paciente"),
                onPressed: () {
                  Estado == true
                      ? EstadoTxt = "Activo"
                      : EstadoTxt = "Inactivo";

                  EditarPaciente(
                      widget.perfil[widget.idperfil].Identificacion,
                      ControlFoto.text,
                      ControlNombres.text,
                      ControlApellidos.text,
                      ControlFechaNacimiento.text,
                      ControlEdad.text,
                      ControlDireccion.text,
                      ControlBarrio.text,
                      ControlTelefono.text,
                      ControlCiudad.text,
                      EstadoTxt!);
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
