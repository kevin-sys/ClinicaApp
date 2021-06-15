import 'package:http/http.dart' as http;
import 'package:clinica/requests/configurl.dart';

void AdicionarUsuario(
    String Identificacion, String Usuario, String Pass) async {
  var url = Uri.parse(Url + "AddDataUsuario.php");

  await http.post(url, body: {
    'Identificacion': Identificacion,
    'Usuario': Usuario,
    'Pass': Pass,
  });
}
