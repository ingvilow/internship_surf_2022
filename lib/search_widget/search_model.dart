import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';

class SearchModel extends ElementaryModel {
  final ValueNotifier<List<Users>?> searchUsers = ValueNotifier([]);

  final ApiService _searchService;

  SearchModel(this._searchService);

  Future<List<Users>?> getUsersByName() async {
    return _searchService.fetchHero();
  }
}
