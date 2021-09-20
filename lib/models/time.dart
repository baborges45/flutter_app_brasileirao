import 'package:app_brasileirao/models/titulos.dart';
import 'package:flutter/material.dart';

class Time {
  late String nome;
  String? brasao;
  int? pontos;
  Color? cor;
  List<Titulo> titulos = [];

  Time({
    required this.nome,
    required this.brasao,
    this.pontos,
    this.cor,
  });
}
