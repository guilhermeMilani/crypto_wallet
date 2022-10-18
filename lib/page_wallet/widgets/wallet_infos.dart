import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/utils/currency_formater.dart';
import '../controller/show_money_state_provider.dart';
import '../controller/total_money_provider.dart';

class WalletInfos extends StatefulHookConsumerWidget {
  const WalletInfos({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<WalletInfos> createState() => _WalletInfosState();
}

class _WalletInfosState extends ConsumerState<WalletInfos> {
  @override
  Widget build(
    BuildContext context,
  ) {
    var visible = ref.watch(showMoneyProvider.state);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cripto",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.red),
              ),
              GestureDetector(
                child: Icon(ref.watch(showMoneyProvider)
                    ? Icons.visibility_off
                    : Icons.visibility),
                onTap: () {
                  setState(() {
                    visible.state = !visible.state;
                  });
                },
              ),
            ],
          ),
          ref.watch(showMoneyProvider)
              ? Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              : Text(
                  realMoney.format(ref.watch(totalMoneyProvider)),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 40),
                ),
          const Text(
            "Valor total de moedas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}