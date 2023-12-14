import 'package:imc_flutter/repositories/imc_mock_repository.dart';

class IMCRepositoryFactory {
  static IMCMockRepository? _imcRepository;

  static IMCMockRepository getRepository() {
    if (_imcRepository != null) {
      return _imcRepository!;
    } else {
      _imcRepository = IMCMockRepository();
      return _imcRepository!;
    }
  }
}
