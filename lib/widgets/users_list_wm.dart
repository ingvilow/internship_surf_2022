import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';
import 'package:test_provider_2/widgets/users_list_models.dart';
import 'package:test_provider_2/widgets/users_lists_screen.dart';

class UsersListWM extends WidgetModel<UsersListScreen, UsersListModel>
    implements IUsersWM {
  final EntityStateNotifier<List<Users>?> _currentUsers =
      EntityStateNotifier(null);

  final StateNotifier<List<Users>?> _searchSuggestion = StateNotifier();
  final TextEditingController _editingController = TextEditingController();

  @override
  ListenableState<EntityState<List<Users>?>> get usersList => _currentUsers;

  @override
  TextEditingController get textEdit => _editingController;

  @override
  ListenableState<List<Users>?> get suggestionUsers => _searchSuggestion;

  String? _query;

  UsersListWM(
    UsersListModel model,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadUsers();
    _editingController.addListener(_loadUsers);
  }

  @override
  void dispose() {
    _editingController
      ..removeListener(_loadUsers)
      ..dispose();

    super.dispose();
  }

  // эта функция и загружает мне всех пользователей.
  //также тут (так как это один и тот же запрос и та же самая модель Users) поиск из списка по имени пользователя
  Future _loadUsers() async {
    try {
      _currentUsers.loading();
      final users = await model.getUser();
      final suggestion = users
          ?.where(
            (element) => element.name.toLowerCase().contains(_query ?? ''),
          )
          .toList();
      _searchSuggestion.accept(suggestion);
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
  ListenableState<EntityState<List<Users>?>> get usersList;

  ListenableState<List<Users>?> get suggestionUsers;

  TextEditingController get textEdit;
}
