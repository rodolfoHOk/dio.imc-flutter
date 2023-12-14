import 'package:hive/hive.dart';
import 'package:imc_flutter/model/configuration_model.dart';

class ConfigurationRepository {
  static late Box _box;

  ConfigurationRepository._create();

  static Future<ConfigurationRepository> load() async {
    if (Hive.isBoxOpen('configuration_model')) {
      _box = Hive.box('configuration_model');
    } else {
      _box = await Hive.openBox('configuration_model');
    }
    return ConfigurationRepository._create();
  }

  void save(ConfigurationModel configurationModel) {
    _box.put('configuration_model', configurationModel);
  }

  ConfigurationModel getData() {
    return _box.get('configuration_model');
  }
}
