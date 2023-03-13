import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/todo_model.dart';

// StateNotifierProvider<SelectNotifier, TodoModel>
// <stateNotifier 타입, return state타입>
final selectProvider =
    StateNotifierProvider<SelectNotifier, TodoModel>((ref) => SelectNotifier());

// StateNotifier<T>를 상속받은 클래스를 작성
// <T>에 반환 타입 작성
class SelectNotifier extends StateNotifier<TodoModel> {
  // super()에서 상태값을 초기화
  SelectNotifier()
      : super(TodoModel(
          id: '1',
          completed: false,
          description: '할일 1',
        ));

  // provider 내부에 함수 선언가능
  void toggleTodo() {
    // 현재상태는 state로 가져올 수 있음
    // state에 저장해줘야 상태가 변경됨
    state = state.copyWith(completed: !state.completed);
  }
}
