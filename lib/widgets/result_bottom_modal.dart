import 'package:flutter/material.dart';

class ResultBottomModal extends StatelessWidget {
  final double imcValue;
  final String imcClassification;
  final PageController pageController;

  const ResultBottomModal(
      {super.key,
      required this.imcValue,
      required this.imcClassification,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
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
                Text(imcValue.round().toString(),
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
                            // persist
                            Navigator.pop(context);
                            pageController.jumpToPage(0);
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
