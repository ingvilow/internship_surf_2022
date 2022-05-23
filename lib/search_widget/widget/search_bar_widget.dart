import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback onClear;
  final TextEditingController controller;

  const SearchBar({
    required this.onChanged,
    required this.onClear,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: onClear,
          ),
          hintText: 'Search Users',
        ),
      ),
    );
  }
}
