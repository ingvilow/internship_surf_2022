import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/detail_info/info_screen.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';
import 'package:test_provider_2/widgets/users_list_models.dart';
import 'package:test_provider_2/widgets/users_lists_screen.dart';

class UsersListWM extends WidgetModel<UsersListScreen, UsersListModel>
    implements IUsersWM {
  final EntityStateNotifier<List<Users>> _currentUsers =
      EntityStateNotifier(null);

  final StateNotifier<List<Users>> _searchSuggestion = StateNotifier();

  @override
  ListenableState<EntityState<List<Users>>> get usersList => _currentUsers;

  @override
  ListenableState<List<Users>> get suggestionUsers => _searchSuggestion;

  UsersListWM(
    UsersListModel model,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadUsers();
  }

  //этот метод фильтрует значения по имени из Search Bar
  @override
  void searchUsers(String str) {
    final currentUsers = _currentUsers.value?.data;
    final searchFilteredUsers = currentUsers
        ?.where((user) => user.name.toLowerCase().contains(str.toLowerCase()))
        .toList();
    _searchSuggestion.accept(searchFilteredUsers);
  }

  //удаление текста, набранного в Search Bar
  @override
  void clear() {
    return _searchSuggestion.value?.clear();
  }

  //переход на другую страницу с детальной информацией
  @override
  void selectUsersDetailed(Users users) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => UserInfo(
          users: users,
        ),
      ),
    );
  }

  // эта функция и загружает мне всех пользователей.
  //также тут (так как это один и тот же запрос и та же самая модель Users) поиск из списка по имени пользователя
  Future _loadUsers() async {
    try {
      _currentUsers.loading();
      final users = await model.getUser();
      _currentUsers.content(users);
    } on Exception catch (err) {
      _currentUsers.error(err);
    }
  }
}

UsersListWM createUsersScreenWM(BuildContext _) => UsersListWM(
      UsersListModel(
        ApiService(),
      ),
    );

abstract class IUsersWM extends IWidgetModel {
  ListenableState<EntityState<List<Users>>> get usersList;

  ListenableState<List<Users>> get suggestionUsers;

  void searchUsers(String str) {}

  void clear() {}

  void selectUsersDetailed(Users users);
}
