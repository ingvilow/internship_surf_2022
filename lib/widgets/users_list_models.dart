import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';
import 'package:test_provider_2/users_model/users_model.dart';

//сервис для того, чтобы забрать из АПИ пользователей
class UsersListModel extends ElementaryModel {
  final ApiService _apiService;
  final UsersModel _usersModel;

  Users? get users => _users;
  Users? _users;

  UsersListModel(
    this._apiService,
    this._usersModel,
  );

  void onUsersTap(Users users) {
    _usersModel.users = users;
  }

  Future<List<Users>?> getUser() async {
    return _apiService.fetchHero();
  }
}
