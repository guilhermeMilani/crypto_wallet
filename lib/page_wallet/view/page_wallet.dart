import 'package:flutter/material.dart';

import '../widgets/crypto_info.dart';
import '../widgets/wallet_infos.dart';

class PageWallet extends StatefulWidget {
  const PageWallet({Key? key}) : super(key: key);

  @override
  State<PageWallet> createState() => _PageWalletState();
}

class _PageWalletState extends State<PageWallet> {
  bool showMoney = true;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          WalletInfos(),
          CryptoInfo(),
        ],
      ),
    );
  }
}