import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    var provider = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.counter.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                provider.incrementCounter();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
