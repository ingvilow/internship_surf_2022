import 'package:intl/intl.dart';

abstract class StringRes {
  static const openBankCardBirthdayEmpty = 'Укажите дату рождения';
  static const openBankCardBirthdayOutOfRange = 'Введите корректную дату';
  static const openBankCardBirthdayTooYoung =
      'К сожалению, в настоящее время заявления на выпуск дебетовой карты СМП Банка принимаются только от Клиентов старше 18 лет';
}

const _ddMmYyyyFormat = 'dd.MM.yyyy';
const defaultLocaleString = 'ru';

class DateRes {
  /// парсинг даты: 08.12.2021
  static DateTime? tryParseDdMmYyyy(String? dateTime) {
    if (dateTime == null) return null;
    try {
      return DateFormat(_ddMmYyyyFormat, defaultLocaleString).parse(dateTime);
    } on FormatException {
      return null;
    }
  }

  /// проверка на валидность введённой строки как некая дата
  static bool isValidDateInput(String? input) {
    if (input == null) return false;
    final split = input.split('.').reversed;
    final date = DateTime.tryParse(split.join('-'));
    if (date == null) return false;
    return int.parse(split.elementAt(0)) == date.year &&
        int.parse(split.elementAt(1)) == date.month &&
        int.parse(split.elementAt(2)) == date.day;
  }
}

/// Функция валидации дня рождения
String? birthdayValidation(String value, DateTime now) {
  final date = DateRes.tryParseDdMmYyyy(value);
  final maxSupportedDate = DateTime(now.year - 18, now.month, now.day);
  final isInputValid = DateRes.isValidDateInput(value);

  if (value.isEmpty) {
    return StringRes.openBankCardBirthdayEmpty;
  } else if (date == null || !isInputValid || date.year < 1920 || date.year > now.year) {
    return StringRes.openBankCardBirthdayOutOfRange;
  } else if (date.isAfter(maxSupportedDate)) {
    return StringRes.openBankCardBirthdayTooYoung;
  } else {
    return null;
  }
}
