// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:app_brasileirao/models/time.dart';
import 'package:app_brasileirao/models/titulos.dart';
import 'package:app_brasileirao/pages/add_titulo_page.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({Key? key, required this.time}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  tituloPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTituloPage(time: widget.time, onSave: addTitulo),
      ),
    );
  }

  addTitulo(Titulo titulo) {
    setState(() {
      widget.time.titulos.add(titulo);
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Salvo com sucesso!')));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // ignore: duplicate_ignore
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          actions: [IconButton(onPressed: tituloPage, icon: Icon(Icons.add))],
          bottom: TabBar(
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatísticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Títulos',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: Image.network(widget.time.brasao.toString()),
              ),
              Text(
                'Pontos: ${widget.time.pontos}',
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
          titulos(),
        ]),
      ),
    );
  }

  Widget titulos() {
    final quantidade = widget.time.titulos.length;

    return quantidade == 0
        ? Container(
            child: Center(
              child: Text('Nenhum Título Ainda!'),
            ),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.emoji_events),
                title: Text(widget.time.titulos[index].campeonato.toString()),
                trailing: Text(widget.time.titulos[index].ano.toString()),
                // onTap: () {
                //   Get.to(
                //     () => EditTituloPage(titulo: time.titulos[index]),
                //     fullscreenDialog: true,
                //   );
                // },
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade,
          );
  }
}
