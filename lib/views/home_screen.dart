import 'package:flutter/material.dart';
import 'package:river_pod/common/default_layout.dart';
import 'package:river_pod/views/family_modifier_provider_screen.dart';
import 'package:river_pod/views/select_provider_screen.dart';
import 'package:river_pod/views/state_notifier_provider_screen.dart';
import 'package:river_pod/views/state_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StateProviderScreen(),
                ),
              );
            },
            child: const Text('state provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StateNotifierProviderScreen(),
                ),
              );
            },
            child: const Text('state notifier provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FamilyModifierProviderScreen(),
                ),
              );
            },
            child: const Text('family modifier provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SelectProviderScreen(),
                ),
              );
            },
            child: const Text('select provider'),
          ),
        ],
      ),
    );
  }
}
