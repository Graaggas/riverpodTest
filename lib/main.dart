import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// final valueNotifierProvider = StateNotifierProvider<ValueNotifier, int>((ref) {
//   return ValueNotifier();
// });

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final naming = watch(nameNotifierProvider);
    final valuing = watch(valueNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(naming),
            Text(valuing.getCounter.toString()),
            Text(valuing.getCounter2.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(valueNotifierProvider.notifier).addValue();
          context.read(nameNotifierProvider.notifier).setName();
        },
      ),
    );
  }
}
