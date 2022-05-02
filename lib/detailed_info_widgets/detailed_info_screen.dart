import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/detailed_info_widgets/detailed_info_wm.dart';
import 'package:test_provider_2/models/user.dart';

class DetailedScreen extends ElementaryWidget<IDeatailedWidget> {
  DetailedScreen({
    Key? key,
    WidgetModelFactory wmFactory = createUsersScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDeatailedWidget wm) {
    return Scaffold(
      appBar: AppBar(),
      body: EntityStateNotifierBuilder<List<Users>?>(
        listenableEntityState: wm.usersList,
        errorBuilder: (_, __, ___) {
          return const Text('No result');
        },
        loadingBuilder: (_, __) {
          return const CircularProgressIndicator();
        },
        builder: (_, data) {
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data![index].name),
                onTap: () {
                  wm.selectUsersDetailed(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
