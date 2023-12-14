import 'package:hive/hive.dart';

part 'configuration_model.g.dart';

@HiveType(typeId: 0)
class ConfigurationModel {
  @HiveField(0)
  String name = "";

  @HiveField(1)
  double height = 0.0;

  ConfigurationModel();

  ConfigurationModel.create(this.name, this.height);
}
