import 'package:flutter/material.dart';

class PageMovements extends StatefulWidget {
  const PageMovements({Key? key}) : super(key: key);

  @override
  State<PageMovements> createState() => _PageMovementsState();
}

class _PageMovementsState extends State<PageMovements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('teste'),
      ),
      body: const Center(child: Text("Mudou de tela")),
    );
  }
}