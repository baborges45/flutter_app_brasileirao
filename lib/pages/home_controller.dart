import 'package:app_brasileirao/models/time.dart';
import 'package:app_brasileirao/repository/times_repository.dart';

class HomeController {
  TimesRepository? timesRepository;

  List<Time> get tabela => timesRepository!.times;

  HomeController() {
    timesRepository = TimesRepository();
  }
}
