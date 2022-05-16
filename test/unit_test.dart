import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_provider_2/service/user_service.dart';

void main() {
  final api = ApiService();

  test('ApiService test', () {
    final itemsFromApi = api.fetchHero();
    expect(itemsFromApi, isNotNull);
  });
}

class ApiMock extends Mock implements ApiService {}
