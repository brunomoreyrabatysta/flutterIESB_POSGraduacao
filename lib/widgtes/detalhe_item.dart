import 'package:flutter/material.dart';

class DetalheItem extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String image;
  final VoidCallback? clique;

  const DetalheItem({
    required this.titulo,
    required this.subtitulo,
    required this.image,
    this.clique,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = image.isEmpty ? CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(backgroundImage: NetworkImage(image),);

    return ListTile(
      onTap: clique,
      leading: avatar,
      title: Text(titulo),
      subtitle: Text(subtitulo),
    );
  }
}
