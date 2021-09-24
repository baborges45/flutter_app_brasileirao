// ignore_for_file: prefer_const_constructors

import 'package:app_brasileirao/models/titulos.dart';
import 'package:app_brasileirao/repository/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditTituloPage extends StatefulWidget {
  Titulo titulo;
  EditTituloPage({Key? key, required this.titulo}) : super(key: key);

  @override
  _EditTituloPageState createState() => _EditTituloPageState();
}

class _EditTituloPageState extends State<EditTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ano.text = widget.titulo.ano.toString();
    _campeonato.text = widget.titulo.campeonato.toString();
  }

  editar() {
    Provider.of<TimesRepository>(context, listen: false).editTitulo(
      titulo: widget.titulo,
      ano: _ano.text,
      campeonato: _campeonato.text,
    );

    Get.back();

    Get.snackbar(
      'Sucesso!',
      'Título Editado!',
      backgroundColor: Colors.green[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Tiulo'),
        backgroundColor: Colors.grey[800],
        actions: [IconButton(icon: Icon(Icons.check), onPressed: editar)],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o ano do titulo!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                controller: _campeonato,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Campeonato',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o campeonato!';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
