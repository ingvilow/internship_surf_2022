import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/detail_info/info_detail_screen.dart';
import 'package:test_provider_2/detail_info/info_screen.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';
import 'package:test_provider_2/users_model/users_model.dart';
import 'package:test_provider_2/widgets/users_list_models.dart';
import 'package:test_provider_2/widgets/users_lists_screen.dart';

class UsersListWM extends WidgetModel<UsersListScreen, UsersListModel>
    implements IUsersWM {
  final EntityStateNotifier<List<Users>?> _currentUsers =
      EntityStateNotifier(null);

  final TextEditingController _editingController = TextEditingController();

  @override
  ListenableState<EntityState<List<Users>?>> get usersList => _currentUsers;

  @override
  TextEditingController get textEdit => _editingController;

  @override
  String get userName => model.users?.name ?? '';

  UsersListWM(
    UsersListModel model,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadUsers();
    _editingController.addListener(textChanged);
  }

  //открывает по нажатию детальную информацию
  @override
  void onUsersTap(Users users) {
    model.onUsersTap(users);
    Navigator.push<void>(
      context,
      MaterialPageRoute(builder: (context) => const InfoScreen()),
    );
  }

  @override
  void dispose() {
    _editingController
      ..removeListener(textChanged)
      ..dispose();

    super.dispose();
  }

  //фильтрация для поиска
  void textChanged() {
    model.getUser().then((value) =>
        value?.where((element) => element.name.contains('')).toList());
  }

  // эта функция и загружает мне всех пользователей.
  // До этого я думала, что достаточно того, что здесь UsersListModel
  //не работало сначала из-за этого
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
        UsersModel(),
      ),
    );

abstract class IUsersWM extends IWidgetModel {
  ListenableState<EntityState<List<Users>?>> get usersList;

  TextEditingController get textEdit;

  String get userName;

  void onUsersTap(Users users);
}
