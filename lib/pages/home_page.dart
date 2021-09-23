import 'package:app_brasileirao/models/time.dart';
import 'package:app_brasileirao/pages/time_page.dart';
import 'package:app_brasileirao/repository/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
      ),
      body: Consumer<TimesRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.times.length,
            itemBuilder: (BuildContext context, int time) {
              final List<Time> tabela = repositorio.times;
              return ListTile(
                leading: Image.network(tabela[time].brasao.toString()),
                title: Text(tabela[time].nome),
                subtitle: Text('Titulos: ${tabela[time].titulos.length}'),
                trailing: Text(tabela[time].pontos.toString()),
                onTap: () {
                  Get.to(() => TimePage(
                        key: Key(tabela[time].nome),
                        time: tabela[time],
                      ));
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
