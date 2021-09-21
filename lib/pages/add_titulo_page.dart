// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_brasileirao/models/time.dart';
import 'package:app_brasileirao/models/titulos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTituloPage extends StatefulWidget {
  Time time;
  ValueChanged<Titulo> onSave;

  AddTituloPage({Key? key, required this.time, required this.onSave})
      : super(key: key);

  @override
  _AddTituloPageState createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Título'),
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
                      return 'Informe o ano do título!';
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
              Expanded(
                  child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(24.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onSave(Titulo(
                          ano: _ano.toString(),
                          campeonato: _campeonato.toString()));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_rounded),
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Salvar',
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
