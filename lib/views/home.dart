import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:noticias_app_fge/model/noticia_api.dart';
import 'package:noticias_app_fge/views/widgets/noticia_crad.dart';

import '../model/noticia_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NoticiaApi client = NoticiaApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FGE'),
      ),
      body: FutureBuilder(
          future: client.getNoticia(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
            if (snapshot.hasData) {
              List<Noticia> notas = snapshot.requireData;
              return ListView.builder(
                itemCount: notas.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(notas[index].title),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
/*
NoticeCard(
          title: "Hola Mundo",
          cookTime: "30 min",
          rating: "5.0",
          thumbnailUrl:
              "https://fiscaliaguerrero.gob.mx/wp-content/uploads/2021/06/cropped-logo_fiscalia.png"),
*/