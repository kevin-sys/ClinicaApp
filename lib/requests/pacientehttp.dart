import 'package:http/http.dart' as http;
import 'package:clinica/requests/configurl.dart';



void AdicionarPaciente(
    String Identificacion,
    String Foto,
    String Nombres,
    String Apellidos,
    String FechaNacimiento,
    String Edad,
    String Direccion,
    String Barrio,
    String Telefono,
    String Ciudad)
async {
  var url = Uri.parse(
      Url+"AddDataPaciente.php");

  await http.post(url, body: {
    'Identificacion': Identificacion,
    'Foto': Foto,
    'Nombres': Nombres,
    'Apellidos': Apellidos,
    'FechaNacimiento': FechaNacimiento,
    'Edad': Edad,
    'Direccion': Direccion,
    'Barrio': Barrio,
    'Telefono': Telefono,
    'Ciudad': Ciudad,
  });
}

void EditarPaciente(
    String Identificacion,
    String Foto,
    String Nombres,
    String Apellidos,
    String FechaNacimiento,
    String Edad,
    String Direccion,
    String Barrio,
    String Telefono,
    String Ciudad,
    String Estado
    ) async {
  var url = Uri.parse(
      Url+"EditDataPaciente.php");

  await http.post(url, body: {
    'Identificacion': Identificacion,
    'Foto': Foto,
    'Nombres': Nombres,
    'Apellidos': Apellidos,
    'FechaNacimiento': FechaNacimiento,
    'Edad': Edad,
    'Direccion': Direccion,
    'Barrio': Barrio,
    'Telefono': Telefono,
    'Ciudad': Ciudad,
    'Estado': Estado,
  }
  );
}

void EliminarPaciente(Identificacion) async {
  var url = Uri.parse(
      Url+"DeleteDataPaciente.php");

  await http.post(url, body: {
    'IdentificacionEliminar': Identificacion,
  });
}
