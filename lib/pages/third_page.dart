import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider_2/provider_counters/another_counter.dart';
import 'package:test_provider_2/provider_counters/counter_provider.dart';

///третья страница
class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AnotherCounter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: ChangeNotifierProvider<AnotherCounter>.value(
          value: provider,
          child: Column(children: [
            Text(provider.counter.toString()),
            ElevatedButton(
              onPressed: () {
                provider.incrementCounter();
              },
              child: const Text('Increment'),
            ),
          ]),
        ),
      ),
    );
  }
}
