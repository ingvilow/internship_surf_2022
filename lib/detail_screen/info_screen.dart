import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/detail_screen/info_screen_detail.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/widgets/users_list_wm.dart';

class InfoScreen extends ElementaryWidget<IUsersWM> {
  const InfoScreen({
    Key? key,
    WidgetModelFactory wmFactory = createUsersScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUsersWM wm) {
    return Scaffold(
      body: Center(
        child: EntityStateNotifierBuilder<List<Users>?>(
          listenableEntityState: wm.usersList,
          errorBuilder: (_, __, ___) {
            return const Text('not found');
          },
          loadingBuilder: (_, __) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          builder: (_, data) {
            for (final user in data!) {
              return InfoScreenDetail(
                users: user,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
