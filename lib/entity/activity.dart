class Activity {
  final int id;
  final String fecha;
  final String nombre;

  const Activity({required this.id, required this.fecha, required this.nombre});

  Map<String, Object?> toMap() {
    return {'id': id, 'fecha': fecha, 'nombre': nombre};
  }

  factory Activity.fromMap(Map<String, Object?> map) {
    return Activity(
      id: map['id'] as int,
      fecha: map['fecha'] as String,
      nombre: map['nombre'] as String,
    );
  }

  @override
  String toString() {
    return 'Activity{id: $id, fecha: $fecha, nombre: $nombre}';
  }
}
