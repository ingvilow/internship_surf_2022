import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';

class ListResult extends StatelessWidget {
  final Users users;
  const ListResult({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(users.name),
    );
  }
}
