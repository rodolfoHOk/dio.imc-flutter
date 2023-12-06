import 'package:imc_flutter/repositories/imc_repository.dart';

class IMCRepositoryFactory {
  static IMCRepository? _imcRepository;

  static IMCRepository getRepository() {
    if (_imcRepository != null) {
      return _imcRepository!;
    } else {
      _imcRepository = IMCRepository();
      return _imcRepository!;
    }
  }
}
