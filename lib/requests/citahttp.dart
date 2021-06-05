import 'package:http/http.dart' as http;
import 'package:clinica/requests/configurl.dart';

void AdicionarCita(
  String CodigoCita,
  String IdentificacionPaciente,
  String NombresPaciente,
  String ApellidosPaciente,
  String IdentificacionPersonal,
  String NombresPersonal,
  String ApellidosPersonal,
  String TipoPersonal,
  String HoraCita,
  String FechaCita,
) async {
  var url =
      Uri.parse(Url+"AddDataCita.php");
  await http.post(url, body: {
    'CodigoCita': CodigoCita,
    'IdentificacionPaciente': IdentificacionPaciente,
    'NombresPaciente': NombresPaciente,
    'ApellidosPaciente': ApellidosPaciente,
    'IdentificacionPersonal': IdentificacionPersonal,
    'NombresPersonal': NombresPersonal,
    'ApellidosPersonal': ApellidosPersonal,
    'TipoPersonal': TipoPersonal,
    'HoraCita': HoraCita,
    'FechaCita': FechaCita,
  });
}

void EditarCita(
    String CodigoCita,
    String EstadoCita,
    String Observacion
    ) async {
  var url = Uri.parse(
      Url+"EditDataCita.php");

  await http.post(url, body: {
    'CodigoCita': CodigoCita,
    'EstadoCita': EstadoCita,
    'Observacion': Observacion,
  });
}
