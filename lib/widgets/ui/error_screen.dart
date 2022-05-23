import 'package:flutter/material.dart';

///экран ошибки
class ErrorScreen extends StatelessWidget {
  final VoidCallback onRefresh;

  const ErrorScreen({
    required this.onRefresh,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onRefresh,
      child: const Text('Reload?'),
    );
  }
}
