// ignore_for_file: prefer_const_constructors

import 'package:app_brasileirao/controller/theme_controller.dart';
import 'package:app_brasileirao/models/time.dart';
import 'package:app_brasileirao/pages/time_page.dart';
import 'package:app_brasileirao/repository/times_repository.dart';
import 'package:app_brasileirao/widgets/brasao.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ThemeController.to;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = HomeController();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert_rounded),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Obx(() => controller.isDark.value
                      ? Icon(Icons.brightness_7_outlined)
                      : Icon(Icons.brightness_2)),
                  title: Obx(() =>
                      controller.isDark.value ? Text('Light') : Text('Dark')),
                  onTap: () => controller.changeTheme(),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<TimesRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.times.length,
            itemBuilder: (BuildContext context, int time) {
              final List<Time> tabela = repositorio.times;
              return ListTile(
                leading:
                    Brasao(image: tabela[time].brasao.toString(), width: 40),
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
