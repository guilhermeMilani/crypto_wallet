import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/model/crypto_entity.dart';
import '../../shared/utils/currency_formater.dart';



class Cabecalho extends StatelessWidget {
  const Cabecalho({
    Key? key,
    required this.model,
  }) : super(key: key);

  final StateController<CryptoEntity> model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.state.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 36),
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(model.state.picture),
            ),
          ],
        ),
        Text(
          model.state.sigla,
          style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          realMoney.format(model.state.value),
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 33),
        ),
      ],
    );
  }
}