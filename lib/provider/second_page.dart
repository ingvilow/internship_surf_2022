import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider_2/provider/counter_provider.dart';
import 'package:test_provider_2/provider/third_page.dart';

/// вторая страница

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Counter();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Provider.of<Counter>(context).counter.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<Counter>().incrementCounter();
                },
                child: const Text('Increase'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(builder: (context) => const ThirdPage()),
            );
          },
        ),
      ),
    );
  }
}
