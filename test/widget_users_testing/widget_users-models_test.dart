import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_provider_2/models/Address.dart';
import 'package:test_provider_2/models/Company.dart';
import 'package:test_provider_2/models/Geo.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';
import 'package:test_provider_2/widgets/users_list_models.dart';

//тут некоторые тесты еще
void main() {
  final apiServiceMock = ApiServiceMock();
  late UsersListModel usersListModel;

  setUp(() {
    usersListModel = UsersListModel(apiServiceMock);
  });

  test('first test init, we check list of users if it is present', () async {
    when<void>(apiServiceMock.fetchHero).thenAnswer(
      (_) => Future.value([0]),
    );
    expect(usersListModel.searchUsers.value, isEmpty);
  });

  test('second init test return empty list', () async {
    when<void>(apiServiceMock.fetchHero).thenAnswer(
      (_) => Future.value(_usersMock),
    );
    await apiServiceMock.fetchHero();
    expect(usersListModel.searchUsers.value, isEmpty);
  });
}

class ApiServiceMock extends Mock implements ApiService {}

final _usersMock = [
  Users(
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
  ),
];
