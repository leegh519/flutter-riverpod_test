import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/common/default_layout.dart';
import 'package:river_pod/provider/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // selectProvider에서 completed 속성 값의 변화만 감지
    // 위젯 리빌딩을 최적화 하기 위해 사용
    final state = ref.watch(selectProvider.select((value) => value.completed));

    return DefaultLayout(
      title: 'State Notifier Provider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(state.toString()),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(selectProvider.notifier).toggleTodo();
            },
            child: Text('toggle'),
          ),
        ],
      ),
    );
  }
}
