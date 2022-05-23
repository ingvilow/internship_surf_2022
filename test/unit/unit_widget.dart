import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:test_provider_2/birthday_validator.dart';

void main() {
  test('validation with empty string', () {
    const values = '12.02.2022';
    if (values.isEmpty) {
      const value = birthdayValidation;
      expect(value, StringRes.openBankCardBirthdayEmpty);
    }
  });

  test('validation for less than 18', () {
    final DateTime time;
    final underAge = DateTime(time.now)
    if (notUnderage.compareTo(underage) == 0) {
      const value = birthdayValidation;
      expect(value, StringRes.openBankCardBirthdayTooYoung);
    }
  });

  test('if 18 is today', () {
    final input = DateTime(2005, 9, 7);
    final date = DateTime.now();
    final result = input.compareTo(date) == 0;
    expect(result, isFalse);
  });

  test('check validation id datetime is not correct', () {
    const input = '30-02-2022';
    if (DateTime.tryParse(input) != null) {
      final date = DateFormat('MM-dd-yyyy').format(DateTime.parse(input));
      expect(date, isTrue);
    }
  });

  test('if the value is out of bound the acceptable value', () {
    const inputFirst = '2022-02-20';
    const inputSecond = '2022-02-30';
    final result = inputFirst.compareTo(inputSecond) == 1;
    expect(result, isFalse);
  });
}
