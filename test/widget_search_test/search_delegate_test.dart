import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:test_provider_2/models/user.dart';
import 'package:test_provider_2/search_widget/search_delegate.dart';
import 'package:test_provider_2/search_widget/search_screen_wm.dart';

void main() {
  final searchUsersWm = SearchScreenWMMock();

  setUp(() {
    when<void>(() => searchUsersWm.usersLists).thenAnswer(
      (_) => ValueNotifier<List<Users>>([]),
    );
    when<void>(searchUsersWm.showSearchScreen).thenAnswer(
      (_) => SearchDelegateScreen(),
    );
  });

/*  testGoldens('select address screen default golden test', (tester) async {
    await tester.pumpWidgetBuilder(searchScreen.build(searchUsersWm));
    await multiScreenGolden(tester, 'select_address_screen');
  });

  testGoldens('select address screen with data golden test', (tester) async {
    when<void>(() => searchUsersWm.usersLists).thenAnswer(
      (_) => ValueNotifier<List<Users>>(_usersMock),
    );

    await tester.pumpWidgetBuilder(searchScreen.build(searchUsersWm));
    await multiScreenGolden(tester, 'select_address_screen_data');
  });*/
}

class SearchScreenWMMock extends Mock implements ISearchWidget {}
/*
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
*/
