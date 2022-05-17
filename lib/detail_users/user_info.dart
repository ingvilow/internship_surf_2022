import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';

//эта страница показывает детальную информацию по каждому пользователю
class UserInfo extends StatelessWidget {
  final Users users;
  const UserInfo({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListTile(
        title: Text(users.name),
        subtitle: Text(users.username),
      ),
    );
  }
}
