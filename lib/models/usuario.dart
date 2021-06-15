class UsuarioSystem {
  final String Identificacion;
  final String Usuario;
  final String TipoUsuario;
  final String Pass;
  final String FechaRegistro;


  UsuarioSystem({
    required this.Identificacion,
    required this.Usuario,
    required this.TipoUsuario,
    required this.Pass,
    required this.FechaRegistro,
  });

  factory UsuarioSystem.fromJson(Map<String, dynamic> json) {
    return UsuarioSystem(
      Identificacion: json['Identificacion'],
      Usuario: json['Usuario'],
      TipoUsuario: json['TipoUsuario'],
      Pass: json['Pass'],
      FechaRegistro: json['FechaRegistro'],

    );
  }
}
