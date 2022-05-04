import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/widgets/users_list_models.dart';
import 'package:test_provider_2/widgets/users_list_wm.dart';

void main() {
  test('check context where we create UserScreenWM', () {
    expect(() => createUsersScreenWM(BuildContextMock()), returnsNormally);
  });

  group('UsersListWM', () {
    final modelData = UsersScreenModelTest();

    Future<UsersListWM> setupWm() async {
      when<Future<List<Users>?>>(modelData.getUser)
          .thenAnswer((invocation) => Future.value([]));

      return UsersListWM(modelData);
    }
  });
}

class UsersScreenModelTest extends Mock implements UsersListModel {}

class BuildContextMock extends Mock implements BuildContext {}
