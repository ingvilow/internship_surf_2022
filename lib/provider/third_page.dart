import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider_2/provider/counter_provider.dart';

///третья страница
class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(context.watch<Counter>().counter.toString()),
            ElevatedButton(
              onPressed: () {
                Provider<void>.value(
                    value: Provider.of<Counter>(context).incrementCounter());
              },
              child: const Text('Increase'),
            ),
          ],
        ),
      ),
    );
  }
}
