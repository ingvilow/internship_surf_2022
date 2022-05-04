import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/detailed_info_widgets/detailed_info_wm.dart';
import 'package:test_provider_2/models/user.dart';

class InfoScreen extends ElementaryWidget<IDetailedWidget> {
  final String name;

  const InfoScreen({
    required this.name,
    Key? key,
    WidgetModelFactory wmFactory = createUsersScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDetailedWidget wm) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder<List<Users>?>(
        valueListenable: wm.user,
        builder: (_, data, __) {
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data![index].username),
              );
            },
          );
        },
      ),
    );
  }
}
