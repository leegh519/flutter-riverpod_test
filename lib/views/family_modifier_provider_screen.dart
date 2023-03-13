import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/common/default_layout.dart';
import 'package:river_pod/provider/family_modifier_provider.dart';

class FamilyModifierProviderScreen extends ConsumerWidget {
  const FamilyModifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 외부에서 데이터를 프로바이더에 전달
    final state = ref.watch(familyModifierProvider(5));

    return DefaultLayout(
      title: 'family modifier provider screen',
      // futureProvider에서 .when을 사용하면
      // 로딩 중, 데이터 있을 때, 에러 있을 때
      // 각각 관리가능
      body: state.when(
        data: (data) {
          return Center(
            child: Text(data.toString()),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
