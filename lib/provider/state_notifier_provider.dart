import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/todo_model.dart';

// StateNotifierProvider<TodoListNotifier,List<TodoModel>>
// <stateNotifier 타입, return state타입>
final stateNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoModel>>(
        (ref) => TodoListNotifier());

// StateNotifier<T>를 상속받은 클래스를 작성
// <T>에 반환 타입 작성
class TodoListNotifier extends StateNotifier<List<TodoModel>> {
  // super()에서 상태값을 초기화
  TodoListNotifier()
      : super(
          [
            TodoModel(
              id: '1',
              completed: false,
              description: '할일 1',
            ),
            TodoModel(
              id: '2',
              completed: false,
              description: '할일 2',
            ),
            TodoModel(
              id: '3',
              completed: false,
              description: '할일 3',
            ),
            TodoModel(
              id: '4',
              completed: false,
              description: '할일 4',
            ),
            TodoModel(
              id: '5',
              completed: true,
              description: '할일 5',
            ),
          ],
        );

  // provider 내부에 함수 선언가능
  void toggleTodo(String id) {
    // 현재상태는 state로 가져올 수 있음
    // state에 저장해줘야 상태가 변경됨
    state = state.map((todo) {
      return todo.id == id ? todo.copyWith(completed: !todo.completed) : todo;
    }).toList();
  }
}
