import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider_2/pages/second_page.dart';
import 'package:test_provider_2/pages/third_page.dart';
import 'package:test_provider_2/provider_counters/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) {
        return Counter();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

///первая страница
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Consumer<Counter>(
          builder: (_, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  value.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Counter>(builder: (_, value, child) {
            return FloatingActionButton(
              onPressed: () {
                value.incrementCounter();
              },
              heroTag: 'Screen 1',
              tooltip: 'Increment 1',
              child: const Icon(Icons.add),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              heroTag: 'Screen 2',
              tooltip: 'Increment 2',
              child: const Text('2'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider<Counter>(
                      create: (context) => Counter(),
                      child: const ThirdPage(),
                    ),
                  ),
                );
              },
              heroTag: 'Screen 3',
              tooltip: 'Increment 3',
              child: const Text('3'),
            ),
          ),
        ],
      ),
    );
  }
}
