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
    var provider = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(children: [
          Text(context.watch<Counter>().counter.toString()),
          ChangeNotifierProvider<Counter>.value(
            value: provider,
            child: ElevatedButton(
              onPressed: () {
                provider.incrementCounter();
              },
              child: const Text('Increment'),
            ),
          ),
        ]),
      ),
    );
  }
}
