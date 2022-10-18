
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../page_details/controller/model_state_provider.dart';
import '../../page_details/view/page_datails.dart';
import '../../shared/model/crypto_entity.dart';
import '../../shared/utils/currency_formater.dart';
import '../controller/show_money_state_provider.dart';
import '../controller/total_money_provider.dart';

class CryptoInfo extends StatefulHookConsumerWidget {
  const CryptoInfo({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CryptoInfo> createState() => _CryptoInfoState();
}

class _CryptoInfoState extends ConsumerState<CryptoInfo> {
  @override
  Widget build(BuildContext context) {
    final assets = ref.watch(cryptoList);
    final model = ref.watch(modelStateProvider.state);
    return Expanded(
      child: ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) {
          ref.watch(totalMoneyProvider) == 0
              ? Future.delayed(Duration.zero).then((value) => ref
                  .read(totalMoneyProvider.notifier)
                  .state += assets[index].value)
              : DoNothingAction();

          return Column(
            children: [
              const Divider(
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PageDatails(),
                    ),
                  );
                  model.state = assets[index];
                },
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(assets[index].picture),
                ),
                title: Row(
                  children: [
                    Text(assets[index].sigla),
                    const Spacer(),
                    ref.watch(showMoneyProvider)
                        ? Container(
                            height: 20,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        : Text(
                            realMoney.format(assets[index].value),
                          ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(assets[index].name),
                    const Spacer(),
                    Text(
                      "${assets[index].quantity} ${assets[index].sigla}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.chevron_right_sharp),
              ),
            ],
          );
        },
      ),
    );
  }
}