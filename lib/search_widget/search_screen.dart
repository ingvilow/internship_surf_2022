import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/search_widget/search_screen_wm.dart';

class SearchScreen extends ElementaryWidget<ISearchWidget> {
  const SearchScreen({
    Key? key,
    WidgetModelFactory wmFactory = createUsersScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISearchWidget wm) {
    return Scaffold(
      body: ValueListenableBuilder<List<Users>?>(
        valueListenable: wm.usersLists,
        builder: (_, data, __) {
          return data == null
              ? Center(child: const Text('not found'))
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index].name),
                      leading: const Icon(Icons.person),
                    );
                  },
                );
        },
      ),
    );
  }
}
