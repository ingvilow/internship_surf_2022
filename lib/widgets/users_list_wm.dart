import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/detail_users/user_info.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';
import 'package:test_provider_2/widgets/users_list_models.dart';
import 'package:test_provider_2/widgets/users_lists_screen.dart';

class UsersListWM extends WidgetModel<UsersListScreen, UsersListModel>
    implements IUsersWM {
  final EntityStateNotifier<List<Users>> _currentUsersState =
      EntityStateNotifier(null);

  final TextEditingController _clearTextController = TextEditingController();

  final StateNotifier<List<Users>> _searchSuggestionState = StateNotifier();

  @override
  ListenableState<EntityState<List<Users>>> get usersList => _currentUsersState;

  @override
  ListenableState<List<Users>> get suggestionUsers => _searchSuggestionState;

  @override
  TextEditingController get clearTextController => _clearTextController;

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
    final currentUsers = _currentUsersState.value?.data;
    final searchFilteredUsers = currentUsers
        ?.where((user) => user.name.toLowerCase().contains(str.toLowerCase()))
        .toList();
    _searchSuggestionState.accept(searchFilteredUsers);
  }

  //перезагрузка пользователей при ошибке
  @override
  void onRefresh() => _loadUsers();

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

  //очищает имя пользователя в Search bar, а также сбрасывает список найденных пользователей пользователей
  @override
  void clear() {
    _searchSuggestionState.accept(null);
    _clearTextController.clear();
  }

  // эта функция и загружает мне всех пользователей.
  //также тут (так как это один и тот же запрос и та же самая модель Users) поиск из списка по имени пользователя
  Future _loadUsers() async {
    try {
      _currentUsersState.loading();
      final users = await model.getUser();
      _currentUsersState.content(users);
    } on Exception catch (err) {
      _currentUsersState.error(err);
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

  TextEditingController get clearTextController;

  ListenableState<List<Users>> get suggestionUsers;

  void searchUsers(String str);

  void clear();

  void selectUsersDetailed(Users users);

  void onRefresh();
}
