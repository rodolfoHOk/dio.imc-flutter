import 'package:flutter/material.dart';
import 'package:imc_flutter/classes/imc.dart';
import 'package:imc_flutter/repositories/imc_hive_repository.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late IMCHiveRepository imcHiveRepository;
  List<IMC> imcList = [];

  void initData() async {
    imcHiveRepository = await IMCHiveRepository.load();
    imcList = imcHiveRepository.list();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: imcList.length,
        itemBuilder: (BuildContext builder, int index) {
          var imc = imcList[index];
          double imcValue = imc.calculate();
          String imcClassification = imc.getClassification(imcValue);
          DateTime date = imc.date;
          String formattedDate =
              "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";

          return Dismissible(
              key: Key(imc.id),
              onDismissed: (DismissDirection direction) {
                imcHiveRepository.remove(imc);
              },
              child: ListTile(
                leading: const SizedBox(
                    height: double.maxFinite,
                    child: Icon(Icons.health_and_safety)),
                isThreeLine: true,
                title: Row(
                  children: [
                    const Text(
                      "Data",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                subtitle: Column(
                  children: [
                    Row(children: [
                      const Text(
                        "IMC: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        imcValue.toStringAsFixed(2),
                      ),
                    ]),
                    Row(children: [
                      const Text(
                        "Classificação:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        imcClassification,
                      ),
                    ]),
                  ],
                ),
              ));
        });
  }
}
