import 'package:flutter/material.dart';
import 'package:imc_flutter/model/configuration_model.dart';
import 'package:imc_flutter/repositories/configuration_repository.dart';

class ConfigurationPage extends StatefulWidget {
  final PageController pageController;

  const ConfigurationPage({super.key, required this.pageController});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController(text: "");

  late ConfigurationRepository configurationRepository;
  ConfigurationModel? configurationModel;

  void initData() async {
    configurationRepository = await ConfigurationRepository.load();
    configurationModel = configurationRepository.getData();
    nameController.text = configurationModel?.name ?? "";
    heightController.text = configurationModel?.height.toString() ?? "";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ListView(
        children: [
          const Center(
            child: Text(
              'Configurações',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Nome",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: nameController,
          ),
          const SizedBox(height: 16),
          const Text(
            "Altura",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: heightController,
          ),
          const SizedBox(height: 24),
          FilledButton(
              onPressed: () {
                if (nameController.text.trim().length < 3) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Nome deve ter ao menos 3 caracteres"),
                      backgroundColor: Colors.red));
                  return;
                }
                var name = nameController.text;

                var height = double.tryParse(heightController.text);
                if (height == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Altura inválida"),
                      backgroundColor: Colors.red));
                  return;
                }

                var configuration = ConfigurationModel.create(name, height);
                configurationRepository.save(configuration);

                widget.pageController.jumpToPage(0);
              },
              child: const Text('Salvar'))
        ],
      ),
    );
  }
}
