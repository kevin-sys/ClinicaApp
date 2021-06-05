import 'package:http/http.dart' as http;
import 'package:clinica/requests/configurl.dart';


void AdicionarPersonal(
    String Identificacion,
    String Foto,
    String Nombres,
    String Apellidos,
    String Tipo)
async {
  var url = Uri.parse(
      Url+"AddDataPersonalAtencion.php");

  await http.post(url, body: {
    'Identificacion': Identificacion,
    'Foto': Foto,
    'Nombres': Nombres,
    'Apellidos': Apellidos,
    'Tipo': Tipo,
  });
}

void EditarPersonalAtencion(
    String Identificacion,
    String Nombres,
    String Foto,
    String Apellidos,
    String Tipo,
    String Estado,
    String Trabajando
    ) async {
  var url = Uri.parse(
      Url+"EditDataPersonalAtencion.php");

  await http.post(url, body: {
    'Identificacion': Identificacion,
    'Nombres': Nombres,
    'Foto': Foto,
    'Apellidos': Apellidos,
    'Tipo': Tipo,
    'Estado': Estado,
    'Trabajando': Trabajando,
  });
}

void EliminarPersonalAtencion(Identificacion) async {
  var url = Uri.parse(
      Url+"DeleteDataPersonalAtencion.php");

  await http.post(url, body: {
    'IdentificacionEliminar': Identificacion,
  });
}
