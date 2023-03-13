import 'package:flutter_riverpod/flutter_riverpod.dart';

// 아무 프로바이더나 .family를 붙여서 사용가능
// 제네릭에 입력받을 데이터 타입을 지정
// 파라미터에 ref, data를 같이 받음
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(const Duration(seconds: 2));

  return List.generate(data, (index) => index);
});
