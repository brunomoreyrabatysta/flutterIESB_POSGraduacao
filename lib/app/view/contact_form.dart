import 'package:flutter/material.dart';
import 'package:trabalho/app/domain/model/character.dart';
import 'package:trabalho/widgtes/detalhe_item.dart';

class Argumentos {
  String name;
  String status;
  String image;

  Argumentos(this.name, this.status, this.image);
}

class ContactForm extends StatelessWidget {
  static const routeName = 'form';
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;
    Character character = new Character(name: argumentos.name, status: argumentos.status, image: argumentos.image);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: DetalheItem(
                          titulo: 'Nome: ${character.name }',
                          subtitulo: 'Status: ${character.status}',
                          image: character.image.toString(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
        ),
      )
    );
  }
}
