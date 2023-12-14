import 'package:flutter/material.dart';
import 'package:imc_flutter/classes/imc.dart';
import 'package:imc_flutter/repositories/imc_hive_repository.dart';

class ResultBottomModal extends StatefulWidget {
  final IMC imc;
  final PageController pageController;

  const ResultBottomModal(
      {super.key, required this.imc, required this.pageController});

  @override
  State<ResultBottomModal> createState() => _ResultBottomModalState();
}

class _ResultBottomModalState extends State<ResultBottomModal> {
  late IMCHiveRepository imcHiveRepository;

  void initData() async {
    imcHiveRepository = await IMCHiveRepository.load();
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    double imcValue = widget.imc.calculate();
    String imcClassification = widget.imc.getClassification(imcValue);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Resultado",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("IMC:", style: TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Text(imcValue.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Classificação:", style: TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Text(imcClassification,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancelar"),
                    ),
                  ),
                  SizedBox(
                      width: 150,
                      child: FilledButton(
                          onPressed: () {
                            imcHiveRepository.add(widget.imc);
                            Navigator.pop(context);
                            widget.pageController.jumpToPage(0);
                          },
                          child: const Text("Salvar"))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
