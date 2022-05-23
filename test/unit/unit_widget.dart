import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('test validator for empty validation', () {
    String? input;
    test('validation with empty string', () {
      final result = input?.isEmpty ?? '';
      expect(result, isEmpty);
    });

    test('validation for less than 18', () {
      final underage = DateTime(2005, 9, 7);
      final notUnderage = DateTime(2022, 9, 7);
      final result = notUnderage.compareTo(underage) == 0;
      expect(result, isFalse);
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
  });
}
