import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/days_graf_state_provider.dart';
import '../controller/model_state_provider.dart';
import '../widgets/cabecalho.dart';
import '../widgets/column_infos.dart';
import '../widgets/crypto_grafic.dart';
import '../widgets/row_button_days.dart';

class PageDatails extends StatefulHookConsumerWidget {
  const PageDatails({Key? key}) : super(key: key);

  @override
  ConsumerState<PageDatails> createState() => _PageDatailsState();
}

class _PageDatailsState extends ConsumerState<PageDatails> {
  List<FlSpot> days = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(modelStateProvider.state);
    final daysGraf = ref.watch(daysGrafProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, top: 35, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Cabecalho(model: model),
              CryptoGrafic(daysGraf: daysGraf, model: model),
              const Divider(
                thickness: 1,
              ),
              const RowButtonDays(),
              const Divider(
                thickness: 1,
              ),
              ColumnInfos(model: model, daysGraf: daysGraf),
            ],
          ),
        ),
      ),
    );
  }
}