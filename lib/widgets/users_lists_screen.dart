import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/search_widget/widget/search_bar_widget.dart';
import 'package:test_provider_2/widgets/ui/list_result.dart';
import 'package:test_provider_2/widgets/users_list_wm.dart';

class UsersListScreen extends ElementaryWidget<IUsersWM> {
  const UsersListScreen({
    Key? key,
    WidgetModelFactory wmFactory = createUsersScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUsersWM wm) {
    return Scaffold(
      body: EntityStateNotifierBuilder<List<Users>?>(
        listenableEntityState: wm.usersList,
        errorBuilder: (_, __, ___) {
          return const Center(child: Text('err'));
        },
        loadingBuilder: (_, __) {
          return const Center(child: CircularProgressIndicator());
        },
        builder: (_, data) {
          return StateNotifierBuilder<List<Users>?>(
            listenableState: wm.suggestionUsers,
            builder: (context, value) {
              return ListView.builder(
                itemCount: value!.length + 1,
                itemBuilder: (context, index) {
                  return index == 0
                      ? SearchBar(
                          controller: wm.textEdit,
                        )
                      : ListResult(users: value[index - 1]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
