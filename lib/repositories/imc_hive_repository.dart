import 'package:hive/hive.dart';
import 'package:imc_flutter/classes/imc.dart';

class IMCHiveRepository {
  static late Box _box;

  IMCHiveRepository._create();

  static Future<IMCHiveRepository> load() async {
    if (Hive.isBoxOpen('IMCList')) {
      _box = Hive.box('IMCList');
    } else {
      _box = await Hive.openBox('IMCList');
    }
    return IMCHiveRepository._create();
  }

  List<IMC> list() {
    return _box.values.cast<IMC>().toList();
  }

  void add(IMC imc) {
    _box.add(imc);
  }

  void remove(IMC imc) {
    imc.delete();
  }
}
