import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/common/default_layout.dart';
import 'package:river_pod/model/todo_model.dart';
import 'package:river_pod/provider/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoModel> todos = ref.watch(stateNotifierProvider);

    return DefaultLayout(
      title: 'State Notifier Provider',
      body: ListView(
        children: todos
            .map(
              // 체크박스 리스트
              (todo) => CheckboxListTile(
                value: todo.completed,
                onChanged: (value) {
                  // stateNotifierProvider.notifier를 하면 notifier클래스를 가져올 수 있음
                  // .notifier로 가져온 후 클래스 내부 함수를 사용해서 상태변경
                  ref.read(stateNotifierProvider.notifier).toggleTodo(todo.id);
                },
                title: Text(todo.description),
              ),
            )
            .toList(),
      ),
    );
  }
}
