import 'package:imc_flutter/classes/imc.dart';

class IMCRepository {
  final List<IMC> _imcs = [];

  Future<List<IMC>> list() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _imcs;
  }

  Future<void> save(IMC imc) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _imcs.add(imc);
  }

  Future<void> remove(String imcId) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _imcs.remove(_imcs.where((imc) => imc.id == imcId).first);
  }
}
