import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/days_graf_state_provider.dart';

class ButtonDays extends StatefulHookConsumerWidget {
  ButtonDays({
    Key? key,
    required this.days,
  }) : super(key: key);
  int days;

  @override
  ConsumerState<ButtonDays> createState() => _ButtonDaysState();
}

class _ButtonDaysState extends ConsumerState<ButtonDays> {
  @override
  Widget build(BuildContext context) {
    final daysGraf = ref.watch(daysGrafProvider.state);
    return InkWell(
      onTap: () {
        daysGraf.state = widget.days;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: widget.days == daysGraf.state
                  ? Colors.grey.shade300
                  : Colors.white,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            "${widget.days} D",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}