import 'dart:convert';

import 'package:http/http.dart';
import 'package:noticias_app_fge/model/noticia_model.dart';

class NoticiaApi {
  final url = Uri.parse(
      "https://fiscaliaguerrero.gob.mx/wp-json/wp/v2/posts?categories=34&per_page=1");

  Future<List<Noticia>> getNoticia() async {
    Response res = await get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['noticias'];

      List<Noticia> noticias =
          body.map((dynamic item) => Noticia.fromJson(item)).toList();
      return noticias;
    } else {
      throw ('No se pueden obtener datos');
    }
  }
}
