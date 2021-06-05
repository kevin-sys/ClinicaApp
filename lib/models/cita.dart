class Citas {
  final String CodigoCita;
  final String IdentificacionPaciente;
  final String NombresPaciente;
  final String ApellidosPaciente;
  final String IdentificacionPersonal;
  final String NombresPersonal;
  final String ApellidosPersonal;
  final String TipoPersonal;
  final String HoraCita;
  final String FechaCita;
  final String EstadoCita;
  final String Observacion;
  final String Emision;

  Citas({
    required this.CodigoCita,
    required this.IdentificacionPaciente,
    required this.NombresPaciente,
    required this.ApellidosPaciente,
    required this.IdentificacionPersonal,
    required this.NombresPersonal,
    required this.ApellidosPersonal,
    required this.TipoPersonal,
    required this.HoraCita,
    required this.FechaCita,
    required this.EstadoCita,
    required this.Observacion,
    required this.Emision,
  });

  factory Citas.fromJson(Map<String, dynamic> json) {
    return Citas(
      CodigoCita: json['CodigoCita'],
      IdentificacionPaciente: json['IdentificacionPaciente'],
      NombresPaciente: json['NombresPaciente'],
      ApellidosPaciente: json['ApellidosPaciente'],
      IdentificacionPersonal: json['IdentificacionPersonal'],
      NombresPersonal: json['NombresPersonal'],
      ApellidosPersonal: json['ApellidosPersonal'],
      TipoPersonal: json['TipoPersonal'],
      HoraCita: json['HoraCita'],
      FechaCita: json['FechaCita'],
      EstadoCita: json['EstadoCita'],
      Observacion: json['Observacion'],
      Emision: json['Emision'],
    );
  }
}
