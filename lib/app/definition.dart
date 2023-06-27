import 'package:flutter/material.dart';
import 'package:trabalho/app/view/about.dart';
import 'package:trabalho/app/view/contact_form.dart';
import 'package:trabalho/app/view/contact_list.dart';
import 'package:trabalho/main.dart';

class Definition extends StatelessWidget {
  const Definition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trabalho final",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => ContactList(),
        ContactForm.routeName: (_) => ContactForm(),
        'about': (_) => About(),
      },

    );
  }
}
