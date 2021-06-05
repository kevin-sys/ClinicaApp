import 'package:clinica/models/personalatencion.dart';
import 'package:clinica/requests/personalatencionhttp.dart';
import 'package:flutter/material.dart';

class ModificarPersonalAtencion extends StatefulWidget {
  final idperfil;
  final List<PersonalAtencion> perfil;
  ModificarPersonalAtencion({Key? key, required this.perfil, this.idperfil});

  @override
  _ModificarPersonalAtencionState createState() => _ModificarPersonalAtencionState();

}

class _ModificarPersonalAtencionState extends State<ModificarPersonalAtencion> {
  TextEditingController ControlIdentificacion = TextEditingController();
  TextEditingController ControlNombres = TextEditingController();
  TextEditingController ControlFoto = TextEditingController();
  TextEditingController ControlApellidos = TextEditingController();
  TextEditingController ControlTipo = TextEditingController();

  bool Estado = false;
  bool Trabajando = false;
  String? EstadoTxt;
  String? TrabajandoTxt;

  @override
  void initState() {
    ControlIdentificacion =
        TextEditingController(text: widget.perfil[widget.idperfil].Identificacion);
    ControlNombres =
        TextEditingController(text: widget.perfil[widget.idperfil].Nombres);
    ControlFoto =
        TextEditingController(text: widget.perfil[widget.idperfil].Foto);
    ControlApellidos =
        TextEditingController(text: widget.perfil[widget.idperfil].Apellidos);
    ControlTipo =
        TextEditingController(text: widget.perfil[widget.idperfil].Tipo);

    EstadoTxt = widget.perfil[widget.idperfil].Estado;
    TrabajandoTxt = widget.perfil[widget.idperfil].Trabajando;

    widget.perfil[widget.idperfil].Estado == 'Activo' ? Estado = true : Estado = false;
    widget.perfil[widget.idperfil].Trabajando == 'Libre' ? Trabajando = true : Trabajando = false;


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar personal de atención"),

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
                controller: ControlTipo,
                decoration: InputDecoration(labelText: "Tipo"),
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
              SwitchListTile(
                title: Text('Disponibilidad'),
                value: Trabajando,
                onChanged: (bool value) {
                  setState(() {
                    Trabajando = value;
                  });
                },
              ),

              ElevatedButton(
                child: Text("Modificar Personal de atención"),
                onPressed: () {
                  Estado == true ? EstadoTxt = "Activo" : EstadoTxt = "Inactivo";
                  Trabajando == true ? TrabajandoTxt = "Libre" : TrabajandoTxt = "En servicio";

                  EditarPersonalAtencion(
                      widget.perfil[widget.idperfil].Identificacion,
                      ControlNombres.text,
                      ControlFoto.text,
                      ControlApellidos.text,
                      ControlTipo.text,
                      EstadoTxt!,
                      TrabajandoTxt!);

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
