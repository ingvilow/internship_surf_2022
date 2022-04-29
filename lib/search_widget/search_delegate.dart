import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';

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
    return SizedBox(
      width: 100,
      height: 50,
      child: Center(
        child: Card(
          elevation: 2,
          color: Colors.lime,
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? <Users>[]
        : _currentUsers.value?.data
            ?.where((element) => element.name.startsWith(query))
            .toList();
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
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Center(child: CircularProgressIndicator()),
            ],
          )
        : ListView.builder(
            itemCount: suggestionList?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(suggestionList![index].name),
              );
            },
          );
  }
}
