import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';

class InfoScreenDetail extends StatelessWidget {
  final String user;
  List<Users> users;

  InfoScreenDetail({
    required this.users,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: users.isNotEmpty
          ? ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index].name),
              );
            })
          : const CircularProgressIndicator(),
    );
  }
}
