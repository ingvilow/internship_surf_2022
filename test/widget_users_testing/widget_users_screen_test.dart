import 'package:elementary/elementary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_provider_2/models/Address.dart';
import 'package:test_provider_2/models/Company.dart';
import 'package:test_provider_2/models/Geo.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/widgets/users_list_wm.dart';
import 'package:test_provider_2/widgets/users_lists_screen.dart';

void main() {
  final wm = UserScreenWM();
  const listUserScreen = UsersListScreen();

  setUp(() {
    when<void>(() => wm.usersList).thenReturn(
      EntityStateNotifier.value(_usersMock.name),
    );

    when<void>(() => wm.usersList).thenReturn(_usersMock.name);
  });
}

class UserScreenWM extends Mock implements IUsersWM {}

final _usersMock = Users(
  id: 1,
  company: Company(name: '', bs: '', catchPhrase: ''),
  address: Address(
    city: '',
    zipcode: '',
    suite: '',
    geo: Geo(lat: '', lng: ''),
    street: '',
  ),
  phone: '',
  username: '',
  website: '',
  email: '',
  name: '',
);
