import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/widgets/users_list_wm.dart';

class UsersListScreen extends ElementaryWidget<IUsersWM> {
  const UsersListScreen({
    Key? key,
    WidgetModelFactory wmFactory = createUsersScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUsersWM wm) {
    return Scaffold(
      appBar: AppBar(),
      body: EntityStateNotifierBuilder<List<Users>?>(
        listenableEntityState: wm.usersList,
        errorBuilder: (_, __, ___) {
          return const Text('err');
        },
        loadingBuilder: (_, __) {
          return const CircularProgressIndicator();
        },
        builder: (_, data) {
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(data![index].name));
            },
          );
        },
      ),
    );
  }
}
