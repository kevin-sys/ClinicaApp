class PersonalAtencion {
  final String Identificacion;
  final String Foto;
  final String Nombres;
  final String Apellidos;
  final String Tipo;
  final String Estado;
  final String Trabajando;

  PersonalAtencion({
    required this.Identificacion,
    required this.Foto,
    required this.Nombres,
    required this.Apellidos,
    required this.Tipo,
    required this.Estado,
    required this.Trabajando,
  });

  factory PersonalAtencion.fromJson(Map<String, dynamic> json) {
    return PersonalAtencion(
      Identificacion: json['Identificacion'],
      Foto: json['Foto'],
      Nombres: json['Nombres'],
      Apellidos: json['Apellidos'],
      Tipo: json['Tipo'],
      Estado: json['Estado'],
      Trabajando: json['Trabajando'],
    );
  }
}
