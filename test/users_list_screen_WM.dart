import 'package:elementary_test/elementary_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_provider_2/widgets/users_list_models.dart';
import 'package:test_provider_2/widgets/users_list_wm.dart';
import 'package:test_provider_2/widgets/users_lists_screen.dart';

void main() {
  test('createUsersListWM', () {
    expect(() => createUsersScreenWM(BuildContextMock()), returnsNormally);
  });

  group('UsersScreenWM', () {
    final model = UsersListMock();

    UsersListWM setupWm() {
      when(model.getUser).thenAnswer((invocation) => Future.value([]));

      return UsersListWM(model);
    }

    testWidgetModel<UsersListWM, UsersListScreen>(
      'call getUsers',
      setupWm,
      (wm, tester, context) async {
        tester.init();
        verify(model.getUser);
      },
    );
  });
}

class BuildContextMock extends Mock implements BuildContext {}

class UsersListMock extends Mock implements UsersListModel {}
