import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:clinica/pages/menuadministrador.dart';
import 'package:clinica/requests/configurl.dart';


void main() => runApp(LoginApp());
String? usuario;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LogIn',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/menuadministrador': (BuildContext context) => new MenuAdministrador(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController Usuario = new TextEditingController();
  TextEditingController Pass = new TextEditingController();

  var mensaje = '';

  Future<List> _login() async {
    final response = await http.post(
        Uri.parse(Url+'Login.php'),
        body: {
          "Usuario": Usuario.text,
          "Pass": Pass.text,
        });

    var datauser = json.decode(response.body);
    print(datauser);
    if (datauser.length == 0) {
      setState(() {
        mensaje = "¡Usuario o contraseña incorrecta!";
      });
    } else {
      if (datauser[0]['TipoUsuario'] == 'Administrador') {
        Navigator.pushReplacementNamed(context, '/menuadministrador');
      } else if (datauser[0]['TipoUsuario'] == 'Personal de atencion') {
        Navigator.pushReplacementNamed(context, '/menumedico');
      }

      setState(() {
        usuario = datauser[0]['Usuario'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://thumbs.dreamstime.com/b/logotipos-m%C3%A9dicos-38707865.jpg'),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 35),
              Card(
                margin: EdgeInsets.all(10.0),
                elevation: 6.0,
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: Form(
                      child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: LogoApp(),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Iniciar sesión en",
                          style: TextStyle(fontSize: 20.0, color: Colors.cyan),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "Clinica Buen Doctor",
                          style: TextStyle(fontSize: 25.0, color: Colors.cyan),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: Usuario,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Usuario',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  Usuario.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: Pass,
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.lock),
                              labelText: 'Contraseña',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  Pass.clear();
                                },
                              )),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (Usuario.text.isNotEmpty &&
                                Pass.text.isNotEmpty) {
                              _login();
                            } else {
                              cajaerror(
                                  context, 'Todos los campos son obligatorios');
                            }
                          },
                          child: Text('Iniciar Sesión',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                        ),
                        SizedBox(height: 5),
                        Text(
                          mensaje,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        )
                      ],
                    ),
                  )),
                ),
              )
            ],
          )),
    );
  }

  Future<dynamic> cajaerror(BuildContext context, String user) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Error al iniciar sesión'),
              content: Text('$user'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginApp()),
                      );
                    },
                    child: Text(
                      'Aceptar',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ));
  }

  Widget LogoApp() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 5, constraints.maxWidth / 5);
        return Center(
          child: CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(
              "https://image.flaticon.com/icons/png/512/306/306473.png",
            ),
          ),
        );
      },
    );
  }
}
