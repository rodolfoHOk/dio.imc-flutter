import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController(text: "");

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
          FilledButton(onPressed: () {}, child: const Text('Salvar'))
        ],
      ),
    );
  }
}
