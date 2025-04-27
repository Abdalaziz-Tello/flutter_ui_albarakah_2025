
import 'package:get_it/get_it.dart';
import 'package:responsive_and_adabtive/main.dart';

GetIt core = GetIt.instance;

setup(){
  core.registerSingleton(ErrorPage());
}