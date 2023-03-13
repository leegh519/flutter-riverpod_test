import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/common/default_layout.dart';
import 'package:river_pod/provider/state_provider.dart';

// provider를 사용하기 위해 ConsumerWidget을 extends 해야함
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch를 통해 provider의 state가 변경될때마다
    // 값을 새로 가져와서 위젯을 리빌딩
    final provider = ref.watch(stateProvider);

    return DefaultLayout(
      title: 'state provider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            provider.toString(),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              // state provider의 state를 update하는 방법 1)
              ref.read(stateProvider.notifier).update((state) => state + 1);
              //
            },
            child: Text('plus'),
          ),
          ElevatedButton(
            onPressed: () {
              // state provider의 state를 update하는 방법 2)
              ref.read(stateProvider.notifier).state =
                  ref.read(stateProvider.notifier).state - 1;
            },
            child: Text('minus'),
          ),
        ],
      ),
    );
  }
}
