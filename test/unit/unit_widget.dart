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
    final now = DateTime.now();
    final maxSupportedDate = DateTime(now.year - 18, now.month, now.day);
    if (maxSupportedDate.isAfter(now)) {
      const value = birthdayValidation;
      expect(value, StringRes.openBankCardBirthdayTooYoung);
    }
  });

  test('if 18 is today', () {
    final now = DateTime.now();
    final nowDateTime = DateTime(23 - 05 - 2022);
    if (nowDateTime.isAtSameMomentAs(now)) {
      const value = birthdayValidation;
      expect(value, 'birthday is today');
    }
  });

  test('check validation is datetime is not correct', () {
    const input = '30-02-2022';
    if (DateTime.tryParse(input) != null) {
      final date = DateFormat('MM-dd-yyyy').format(DateTime.parse(input));
      const value = birthdayValidation;
      expect(date, value);
    }
  });

  test('if the value is out of bound the acceptable value', () {
    final nowDateTime = DateTime(23 - 05 - 2022);
    final boundDateTime = DateTime(32 - 05 - 2022);
    if (nowDateTime.compareTo(boundDateTime) == 0) {
      const value = birthdayValidation;
      expect(value, 'out of bound');
    }
  });
}
