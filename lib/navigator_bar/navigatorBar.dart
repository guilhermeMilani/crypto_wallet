
import 'package:flutter/material.dart';

import '../page_movements/view/page_movements.dart';
import '../page_wallet/view/page_wallet.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigatorBar> createState() => _BottomNavigationWarrenState();
}

class _BottomNavigationWarrenState extends State<NavigatorBar> {
  int opcaoSelecionado = 0;
  @override
  Widget build(BuildContext context) {
    
    void onItemTap(int index) {
      opcaoSelecionado = index;
      setState(() {});
    }

    List<Widget> pages = [
      const PageWallet(),
      const PageMovements(),
    ];

    return Scaffold(
      body: pages.elementAt(opcaoSelecionado),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: opcaoSelecionado,
        onTap: onItemTap,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/Warren.png"),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/Movimentacoes.png"),
              ),
              label: "Movimentações"),
        ],
      ),
    );
  }
}