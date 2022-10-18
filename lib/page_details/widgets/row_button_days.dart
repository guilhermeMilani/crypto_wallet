import 'package:flutter/material.dart';

import 'button_days.dart';

class RowButtonDays extends StatelessWidget {
  const RowButtonDays({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonDays(
          days: 5,
        ),
        ButtonDays(
          days: 15,
        ),
        ButtonDays(
          days: 30,
        ),
        ButtonDays(
          days: 45,
        ),
        ButtonDays(
          days: 90,
        ),
      ],
    );
  }
}