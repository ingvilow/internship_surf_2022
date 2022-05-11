import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/search_widget/search_delegate.dart';
import 'package:test_provider_2/search_widget/search_model.dart';
import 'package:test_provider_2/search_widget/search_screen.dart';
import 'package:test_provider_2/service/user_service.dart';

class SearchUserWM extends WidgetModel<SearchScreen, SearchModel>
    implements ISearchWidget {
  final ValueNotifier<List<Users>?> searchUsers = ValueNotifier([]);

  @override
  ValueListenable<List<Users>?> get usersLists => searchUsers;

  SearchUserWM(SearchModel model) : super(model);

  //инициализирует открытие поиска в верхнем баре
  Future<void> showSearchScreen() async {
    await showSearch<void>(
      context: context,
      delegate: SearchDelegateScreen(),
      query: '',
    );
  }
}

abstract class ISearchWidget extends IWidgetModel {
  ValueListenable<List<Users>?> get usersLists;
}

SearchUserWM createUsersScreenWM(BuildContext _) => SearchUserWM(
      SearchModel(
        ApiService(),
      ),
    );
