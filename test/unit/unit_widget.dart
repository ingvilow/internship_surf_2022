import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_provider_2/birthday_validator.dart';

void main() {
  final dateTime = DateTime(2017, 9, 7, 17, 30);
  setUpAll(initializeDateFormatting);
  test('validation with empty string', () {
    final value = birthdayValidation('', dateTime);
    expect(value, StringRes.openBankCardBirthdayEmpty);
  });

  test('validation for less than 18', () {
    final value = birthdayValidation('20.01.2000', dateTime);
    expect(value, StringRes.openBankCardBirthdayTooYoung);
  });

  test('today is 18', () {
    final value = birthdayValidation('07.09.1999', dateTime);
    expect(value, value);
  });

  test('if the value is out of bound the acceptable value', () {
    final value = birthdayValidation('35.01.2000', dateTime);
    expect(value, StringRes.openBankCardBirthdayOutOfRange);
  });
}
