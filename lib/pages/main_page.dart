import 'package:flutter/material.dart';
import 'package:imc_flutter/pages/add_imc_page.dart';
import 'package:imc_flutter/pages/history_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pageController = PageController();
  int pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Aplicativo IMC")),
        body: Column(
          children: [
            Expanded(
                child: PageView(
              onPageChanged: (int value) {
                setState(() {
                  pagePosition = value;
                });
              },
              controller: pageController,
              children: const [HistoryPage(), AddIMCPage()],
            )),
            BottomNavigationBar(
                currentIndex: pagePosition,
                onTap: (int value) {
                  pageController.jumpToPage(value);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.history), label: "Histórico"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.health_and_safety),
                      label: "Adicionar IMC")
                ])
          ],
        ));
  }
}
