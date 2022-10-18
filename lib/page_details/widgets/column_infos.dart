
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/model/crypto_entity.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/variation.dart';



class ColumnInfos extends StatelessWidget {
  const ColumnInfos({
    Key? key,
    required this.model,
    required this.daysGraf,
  }) : super(key: key);

  final StateController<CryptoEntity> model;
  final StateController<int> daysGraf;

  @override
  Widget build(BuildContext context) {
    final variation = Variation.variationCrypto(
                  model.state.valueActual[daysGraf.state ],
                  model.state.valueActual[daysGraf.state -1]);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Preço Atual",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 19),
            ),
            Text(
              realMoney.format(model.state.valueActual.reversed
                  .toList()[daysGraf.state - 1]),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Variação 24h",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 19),
            ),
            Text(
              
              variation,
              style: TextStyle(
                  color: variation.toString().contains("+")  ? Colors.green : Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quantidade",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 19),
            ),
            Text(
              "${model.state.quantity} ${model.state.sigla}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Valor",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 19,
              ),
            ),
            Text(
              realMoney.format(model.state.value),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 60,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Converter Moedas",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}