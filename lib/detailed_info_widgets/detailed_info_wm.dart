import 'dart:math';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/detailed_info_widgets/detailed_info_model.dart';
import 'package:test_provider_2/detailed_info_widgets/detailed_info_screen.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';

class DetailedScreenWM extends WidgetModel<DetailedScreen, DetailedModel>
    implements IDetailedWidget {
  final EntityStateNotifier<List<Users>?> _currentUsers =
      EntityStateNotifier(null);

  @override
  ValueListenable<List<Users>?> get user => model.searchUsers;

  @override
  ListenableState<EntityState<List<Users>?>> get usersList => _currentUsers;

  DetailedScreenWM(
    DetailedModel model,
  ) : super(model);

  @override
  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadUsers();
  }

  @override
  void selectUsersDetailed() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => DetailedScreen(
          users: _currentUsers.value?.data,
        ),
      ),
    );
  }

  Future<void> _loadUsers() async {
    try {
      _currentUsers.loading();
      final users = await model.getDetailedUsers();
      _currentUsers.content(users);
    } on Exception catch (err) {
      _currentUsers.error(err);
    }
  }
}

abstract class IDetailedWidget extends IWidgetModel {
  ListenableState<EntityState<List<Users>?>> get usersList;

  ValueListenable<List<Users>?> get user;

  void selectUsersDetailed();
}

DetailedScreenWM createUsersScreenWM(BuildContext _) => DetailedScreenWM(
      DetailedModel(
        ApiService(),
      ),
    );
