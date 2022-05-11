import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/search_widget/search_screen.dart';

class SearchDelegateScreen extends SearchDelegate<dynamic> {
  final EntityStateNotifier<List<Users>?> _currentUsers =
      EntityStateNotifier(null);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.close),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      title: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? _currentUsers.value?.data
        : _currentUsers.value?.data
            ?.where((element) => element.name.startsWith(query))
            .toList();

    if (kDebugMode) {
      print(_currentUsers.value?.data);
    }
    if (query.length < 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: Text(
              'Должно быть больше 2-ух символов',
            ),
          ),
        ],
      );
    }
    return _currentUsers.value?.data == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: suggestionList?.length,
            itemBuilder: (context, index) {
              if (kDebugMode) {
                print(_currentUsers.value?.data);
              }
              return ListTile(
                title: Text(suggestionList![index].name),
              );
            },
          );
  }
}
