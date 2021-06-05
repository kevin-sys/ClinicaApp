class Paciente {
  final String Identificacion;
  final String Foto;
  final String Nombres;
  final String Apellidos;
  final String FechaNacimiento;
  final String Edad;
  final String Direccion;
  final String Barrio;
  final String Telefono;
  final String Ciudad;
  final String Estado;
  final String FechaRegistro;


  Paciente({
    required this.Identificacion,
    required this.Foto,
    required this.Nombres,
    required this.Apellidos,
    required this.FechaNacimiento,
    required this.Edad,
    required this.Direccion,
    required this.Barrio,
    required this.Telefono,
    required this.Ciudad,
    required this.Estado,
    required this.FechaRegistro,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      Identificacion: json['Identificacion'],
      Foto: json['Foto'],
      Nombres: json['Nombres'],
      Apellidos: json['Apellidos'],
      FechaNacimiento: json['FechaNacimiento'],
      Edad: json['Edad'],
      Direccion: json['Direccion'],
      Barrio: json['Barrio'],
      Telefono: json['Telefono'],
      Ciudad: json['Ciudad'],
      Estado: json['Estado'],
      FechaRegistro: json['FechaRegistro'],

    );
  }
}
