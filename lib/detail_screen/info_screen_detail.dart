import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';

class InfoScreenDetail extends StatelessWidget {
  final Users users;

  const InfoScreenDetail({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text(users.username),
        );
      }),
    );
  }
}
