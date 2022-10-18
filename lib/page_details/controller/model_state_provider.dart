import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/model/crypto_entity.dart';

final modelStateProvider = StateProvider(
  (ref) => CryptoEntity(
    name: '',
    sigla: '',
    picture: '',
    valueActual: [0],
    variation: 0,
    quantity: 0,
    value: 0,
  ),
);