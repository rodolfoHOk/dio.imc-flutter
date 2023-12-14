import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imc_flutter/imc_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  runApp(const IMCApp());
}
