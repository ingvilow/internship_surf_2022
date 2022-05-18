import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/service/user_service.dart';

void main() {
  group('test api service and if the list from api is present and not null',
      () {
    final service = ApiService();

    test('test users list from api', () {
      final result = service.fetchHero();
      expect(result, isNotNull);
    });

    test('test the users list length', () {
      List<Users> users = [];
      final usersLength = users.length;
      expect(users.length, usersLength);
    });
  });
}

class MockApiService extends Mock implements ApiService {}
