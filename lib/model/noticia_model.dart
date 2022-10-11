class Noticia {
  final String title;
  final String imagen;
  final String fecha;
  final String contenido;

  Noticia(
      {required this.title,
      required this.imagen,
      required this.fecha,
      required this.contenido});

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
        title: json['title']['rendered'] as String,
        imagen: json['better_featured_image']['media_details']['large']
            ['source_url'] as String,
        fecha: json['date'] as String,
        contenido: json['content']['rendered'] as String);
  }
}
