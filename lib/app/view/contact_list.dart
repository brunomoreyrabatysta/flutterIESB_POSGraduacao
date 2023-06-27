import 'package:flutter/material.dart';
import 'package:trabalho/app/domain/model/character.dart';
import 'package:trabalho/app/view/contact_form.dart';
import 'package:trabalho/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:trabalho/widgtes/detalhe_item.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Character> _listChar = [];

  Future<void> loadContatos() async{
    final response = await http.get(Uri.parse(Constantes.baseUrl));
    Map body = jsonDecode(response.body);
    List characterList = body['results'];

    _listChar = characterList.map((e) => Character.fromJson(e)).toList();
  }


  @override
  Widget build(BuildContext context) {
    loadContatos();

    return Scaffold(
        appBar: AppBar(
          title: Text('Contatos'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  //Navigator.of(context).pushNamed('about');
                  Navigator.pushNamed(context, 'about');
                },
                icon: Icon(Icons.help)
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _listChar.length,
          itemBuilder: (_, indice) {
            Character character = _listChar[indice];

            final avatar = character.image.toString().isEmpty ? CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(backgroundImage: NetworkImage(character.image.toString()),);
            return DetalheItem(
              titulo: character.name.toString(),
              subtitulo: character.status.toString(),
              image: character.image.toString(),
              clique: () {
                Character ch = _listChar[indice];

                Navigator.pushNamed(context, 'form', arguments: Argumentos(ch.name.toString(), ch.status.toString(),ch.image.toString()));
              },
            );

          },
        ));
  }
}
