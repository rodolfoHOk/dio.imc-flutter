import 'package:flutter/material.dart';
import 'package:imc_flutter/classes/imc.dart';
import 'package:imc_flutter/widgets/result_bottom_modal.dart';

class AddIMCPage extends StatefulWidget {
  final PageController pageController;

  const AddIMCPage({super.key, required this.pageController});

  @override
  State<AddIMCPage> createState() => _AddIMCPageState();
}

class _AddIMCPageState extends State<AddIMCPage> {
  TextEditingController weightController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ListView(
        children: [
          const Center(
            child: Text(
              "Calculadora IMC",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Peso",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          const Text(
            "Altura",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              IMC imcObject = IMC(double.parse(weightController.text),
                  double.parse(heightController.text));
              double imcValue = imcObject.calculate();
              String imcClassification = imcObject.getClassification(imcValue);
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ResultBottomModal(
                        pageController: widget.pageController,
                        imcValue: imcValue,
                        imcClassification: imcClassification);
                  });
            },
            child: const Text("Calcular"),
          )
        ],
      ),
    );
  }
}
