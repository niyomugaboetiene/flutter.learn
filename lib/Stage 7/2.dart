// Riverpod: imporoved version of provider. no BuildContext is needed

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// step 1. create provider
final counterProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Riverpod"),),

      body: Center(
        child: Text("$count", style: TextStyle(fontSize: 20),),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Text("Add"),
        ),
    )
  }
}
