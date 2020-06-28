import 'package:get_it/get_it.dart';
import 'package:planteria/helper/color.dart';

GetIt sl = GetIt.instance;
void serviceLocator() async {
  sl.registerSingleton<Customcolor>(Customcolor());
}
