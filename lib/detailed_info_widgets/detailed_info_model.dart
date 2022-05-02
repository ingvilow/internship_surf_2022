import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';

class DetailedModel extends ElementaryModel {
  final ValueNotifier<List<Users>?> searchUsers = ValueNotifier([]);

  final ApiService _searchService;
  DetailedModel(
    this._searchService,
  );

  Future<List<Users>> getDetailedUsers() async {
    return _searchService
        .fetchHero()
        .then((value) => searchUsers.value = value);
  }
}
